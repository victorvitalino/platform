module Candidate
  class CadastreMirror < ActiveRecord::Base
    belongs_to :special_condition
    belongs_to :city, class_name: 'Address::City'
    belongs_to :state, class_name: 'Address::State'
    belongs_to :work_city, class_name: 'Address::City'
    belongs_to :civil_state
    belongs_to :program
    belongs_to :city, class_name: "Address::City"
    belongs_to :work_city, class_name: "Address::City"
    belongs_to :cadastre

    has_many :dependent_mirrors, dependent: :destroy
    has_many :attendance_logs
    has_many :cadastre_checklists
    has_many :cadastre_procedurals

    has_one :pontuation

    enum situation: ['em_progresso','pendente', 'aprovado']
    enum gender: ['N/D', 'masculino', 'feminino']

    FAMILY_INCOME = 880 * 12

    def pontuation?
      Candidate::Pontuation.where(cadastre_mirror_id: self.id).present?  
    end

    def set_clone(attributes = {})
      attributes.each do |key, value|
        unless %w(id created_at updated_at).include? key
          self[key] = value if self.attributes.has_key?(key)
        end
      end
    end

    def set_clone_dependent(dependents = {})
      
      dependents.each do |dependent|

        @new_dependent = self.dependent_mirrors.new 

        dependent.attributes.each do |key, value|
          unless %w(id created_at updated_at).include? key 
            @new_dependent[key] = value
          end
        end

        @new_dependent.save!
      end

    end

    def arrival_df_time(date)
      date.year - self.arrival_df.strftime("%Y").to_i if self.arrival_df.present?
    end

    def timelist_time(date)
      date.year - self.created_at.year
    end

    def supervisor_step?
      self.cadastre_procedurals.present?
    end

    def attendant_step?
      !self.cadastre_procedurals.present?
    end

    # => logs

    def attendance_log!(content, user_id)
      cadastre = Candidate::Cadastre.find(self.cadastre_id)

      cadastre.attendance_logs.create({
        cadastre_id: cadastre.id,
        cadastre_mirror_id: self.id,
        content: content,
        user_id: user_id
      })
    end


    # => validações do mundo legal

    def check_arrival_df
      (Date.today - self.born).to_i / 365

      date = Date.parse(self.arrival_df) rescue nil

      if date.present?
        ((Date.today - date).to_i / 365) < 5
      else
        false
      end
    end

    def check_cadin
      Candidate::Cadin.find_by_cpf(self.cpf).present?      
    end


    def check_dependent
      Candidate::Dependent.where(cpf: self.cpf).present?
    end

    def check_family_income
      income_dep = self.dependent_mirrors.sum(:income)

      (income_dep + self.income) > FAMILY_INCOME
    end

    # => functions

    def finish_attendance!(staff_id, observation, situation)

      # => criação de ordem processual
      @procedural = Candidate::CadastreProcedural.new({
        cadastre_mirror_id: self.id,
        cadastre_id: self.cadastre_id,
        staff_id: staff_id,
        observation: observation,
        assessment_id: 1,
        procedural_status_id: situation
      })

      @procedural.save
    end
  end
end
