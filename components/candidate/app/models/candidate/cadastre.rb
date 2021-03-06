module Candidate
  class Cadastre < ActiveRecord::Base

    belongs_to :special_condition
    belongs_to :city, class_name: 'Address::City'
    belongs_to :state, class_name: 'Address::State'
    belongs_to :work_city, class_name: 'Address::City'
    belongs_to :civil_state
    belongs_to :program
    belongs_to :city, class_name: "Address::City"
    belongs_to :work_city, class_name: "Address::City"

    has_many :cadastre_mirrors
    has_many :dependents
    has_many :cadastre_situations
    has_many :attendances
    has_many :pontuations , ->  { order(:id)}
    has_many :positions
    has_many :cadastre_attendances
    has_many :cadastre_checklists
    has_many :attendance_logs
    has_many :firm_enterprise_statuses, class_name: 'Firm::EnterpriseStatus'
    #has_many :enterprise_cadastres, foreign_key: "cadastre_id", class_name: "Firm::EnterpriseCadastre"
    has_many :enterprise_cadastres, foreign_key: "cadastre_id", class_name: "Candidate::EnterpriseCadastre"

    has_many :cadastre_address
    has_many :cadastre_procedurals
    has_many :cadastre_logs
    has_many :inheritors
    has_many :cadastre_activities
    has_many :old_candidates, class_name: 'Entity::OldCandidate'

    scope :situation, -> (situation) {
      self.joins(:cadastre_situations)
      .where('candidate_cadastre_situations.situation_status_id = (SELECT MAX(candidate_cadastre_situations.situation_status_id)
              FROM candidate_cadastre_situations WHERE candidate_cadastre_situations.cadastre_id = candidate_cadastres.id)')
      .where('candidate_cadastre_situations.situation_status_id = ?', situation)
    }



    scope :regularization,  -> {where(program_id: [3,6])}
    scope :habitation,      -> {where(program_id: [1,2,4,5,6,7,8])}
    scope :by_cpf,          -> (cpf = nil) { where(cpf: cpf) }

    enum gender: ['N/D', 'masculino', 'feminino']

    accepts_nested_attributes_for :dependents, allow_destroy: true

    #validates :cpf, cpf: true


    def self.updated_day(day)
      self.where(updated_at: day).count
    end

    def schedules
      Schedule::AgendaSchedule.where(cpf: self.cpf)
    end

    def current_situation_id
        if cadastre_situations.present?
            cadastre_situations.order('id ASC').last.situation_status_id
        end
    end

    def current_situation_status
        if cadastre_situations.present?
            cadastre_situations.order('id ASC').last.situation_status.status
        end
    end

    def current_situation_name
        if cadastre_situations.present? && cadastre_situations.order('id ASC').last.situation_status.present?
            cadastre_situations.order('id ASC').last.situation_status.name.upcase
        end
    end

    def age
      (Date.today - self.born).to_i / 365
    end


    def special?
        (self.special_condition_id == 2 || self.special_condition_id == 3)
    end

    def older?
        if self.born.present?
          (self.age >= 60)
        else
          false
        end
    end

    def zone?
        case self.income
        when 0..1600
          [1, 0, 1600]
        when 1601..3275
          [2, 1601, 3275]
        when 3276..5000
          [3, 3276, 5000]
        else
          [4, 5000, 99999]
        end
    end


    def special_family?
        self.dependents.where(special_condition_id: [2,3]).present?
    end


    def list
      array = Array.new


      list_rii          = rii
      list_rie          = rie
      list_olders       = olders
      list_vulnerables  = vulnerables
      list_specials     = specials

      array << list_rii         unless list_rii.nil?
      array << list_rie         unless list_rie.nil?

      if self.current_situation_id != 2
        array << list_olders      unless list_olders.nil?
        array << list_vulnerables unless list_vulnerables.nil?
        array << list_specials    unless list_specials.nil?
      end

      array.each_with_index do |a, i|
        array[i] << position(array[i])
      end

      array
    end

    private

    def rii
      (self.program_id == 1) ? ['rii', self.zone?] : nil
    end

    def rie
      (self.program_id == 2) ? ['rie', self.zone?] : nil
    end

    def specials
      (self.special? || self.special_family?) ? ['special', self.zone?] : nil
    end

    def olders
      self.older? ? ['older', self.zone?] : nil
    end

    def vulnerables
      (self.program_id == 4) ? ['vulnerable', self.zone?] : nil
    end

    def position(array)

        if array[0] == 'rii' || array[0] == 'rie'
            if self.current_situation_id == 2
              sql = "program_id = ? AND code = 20141201"
              @geral = Candidate::View::GeneralPontuation.where(sql, self.program_id).map(&:cpf).find_index(self.cpf)
            else
              sql = "program_id = ? AND situation_status_id = ? AND convocation_id > 1524 AND procedural_status_id IN(14, 72) AND income BETWEEN ? AND ?"
              @geral = Candidate::View::GeneralPontuation.where(sql, self.program_id, self.current_situation_id, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)
            end
        else
            case array[0]
            when 'older'
                sql = "extract(year from age(born)) >= 60 AND convocation_id > 1524 AND procedural_status_id IN(14, 72) AND situation_status_id = ? AND income BETWEEN  ? AND ? "
                @geral = Candidate::View::GeneralPontuation.where(sql, self.current_situation_id, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)
            when 'special'
                sql = "(special_condition_id in (2,3) or (select COUNT(*)
                        from candidate_dependents
                        where special_condition_id in (2,3)
                        and cadastre_id = general_pontuations.id) > 0)
                        and situation_status_id = ?
                        and convocation_id > 1524
                        and procedural_status_id IN(14, 72)
                        and income BETWEEN ? AND ?"

                @geral = Candidate::View::GeneralPontuation.where(sql, self.current_situation_id, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)

            when 'vulnerable'
                sql = "program_id = ? AND convocation_id > 1524 AND procedural_status_id IN(14, 72) AND income BETWEEN ? AND ?"
                @geral = Candidate::View::GeneralPontuation.where(sql, 4, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)
            end
        end

        @geral.present? ? @geral + 1 : nil
    end



    #program_id = 4 AND income BETWEEN 0 AND 1600

    #
  end
end
