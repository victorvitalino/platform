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
    
    has_one    :attendance_cadastre, class_name: "Attendance::Cadastre"

    has_many :dependent_mirrors, dependent: :destroy
    has_many :attendance_logs
    has_many :cadastre_checklists
    has_many :cadastre_procedurals
    has_many :attendances
    has_many :iptus, foreign_key: 'cpf'
    has_many :cadastre_attendances


    has_one :pontuation

    enum situation: ['em_progresso','pendente', 'aprovado']
    enum gender: ['N/D', 'masculino', 'feminino']

    FAMILY_INCOME = 880 * 12

    # => abstração

    def age
      (Date.today - self.born).to_i / 365
    end

    def pontuation?
      Candidate::Pontuation.where(cadastre_mirror_id: self.id).present?  
    end

 
    def arrival_df_time(date)
      date.year - self.arrival_df.strftime("%Y").to_i if self.arrival_df.present?
    end

    def timelist_time(date)
      date.year - self.created_at.year
    end

    def self.check_arrival_df(id)
      mirror = Candidate::CadastreMirror.find(id)
      
      (Date.today - self.born).to_i / 365
      date = Date.parse(mirror.arrival_df) rescue nil

      if date.present?
        ((Date.today - date).to_i / 365) < 5
      else
        false
      end
    end

    def self.family_income_calc(id)
      mirror = Candidate::CadastreMirror.find(id)
      income_dep = mirror.dependent_mirrors.sum(:income)

      (income_dep + mirror.income) > FAMILY_INCOME
    end
  
  end
end
