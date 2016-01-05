module Candidate
  class Cadastre < ActiveRecord::Base

    belongs_to :special_condition
    belongs_to :city
    belongs_to :state
    belongs_to :work_city
    belongs_to :civil_state
    belongs_to :program
    belongs_to :city, class_name: "Address::City"
    belongs_to :work_city, class_name: "Address::City"

    has_many :dependents
    has_many :cadastre_situations
    has_many :attendances
    has_many :pontuations

    has_many :cadastre_checklists
    has_many :firm_enterprise_statuses, class_name: 'Firm::EnterpriseStatus'
    has_many :enterprise_cadastres, foreign_key: "cadastre_id", class_name: "Firm::EnterpriseCadastre"


    accepts_nested_attributes_for :dependents, allow_destroy: true

    scope :by_cpf, -> (cpf = nil) { where(cpf: cpf) }

    enum gender: ['N/D', 'masculino', 'feminino']

    validates :cpf, cpf: true


    def current_situation_id
        if cadastre_situations.present?
            cadastre_situations.order('id ASC').last.situation_status_id
        end
    end

    def current_situation_name
        if cadastre_situations.present? && cadastre_situations.order('id ASC').last.situation_status.present?
            cadastre_situations.order('id ASC').last.situation_status.name.upcase 
        end
    end


    def special?
        (self.special_condition_id == 2 || self.special_condition_id == 3)
    end

    def older?
        if self.born.present?
          days = (Date.today - self.born).to_i / 365 
          (days >= 60)
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
      array << list_olders      unless list_vulnerables.nil? 
      array << list_vulnerables unless list_vulnerables.nil? 
      array << list_specials    unless list_specials.nil? 

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
            sql = "program_id = ? AND situation_status_id = ? AND income BETWEEN ? AND ?"
            @geral = Candidate::View::GeneralPontuation.where(sql, self.program_id, self.current_situation_id, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)
        else
            case array[0]
            when 'older'
                sql = "extract(year from age(#{self.born})) >= 60 AND #{self.income} and situation_status_id = ? BETWEEN  ? AND ? "
                @geral = Candidate::View::GeneralPontuation.where(sql, self.current_situation_id, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)
            when 'special'
                sql = "(special_condition_id in (2,3) or (select COUNT(*) 
                        from candidate_dependents 
                        where special_condition_id in (2,3)
                        and cadastre_id = general_pontuations.id) > 0)
                        and situation_status_id = ? 
                        and income BETWEEN ? AND ?"

                @geral = Candidate::View::GeneralPontuation.where(sql, self.current_situation_id, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)
            
            when 'vulnerable'
                sql = "program_id = ? AND income BETWEEN ? AND ?"
                @geral = Candidate::View::GeneralPontuation.where(sql, 4, array[1][1], array[1][2]).map(&:cpf).find_index(self.cpf)
            end    
        end

        @geral.present? ? @geral + 1 : nil
    end


    

    #program_id = 4 AND income BETWEEN 0 AND 1600

    #
  end
end
