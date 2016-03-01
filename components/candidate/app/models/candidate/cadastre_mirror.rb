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

    has_many :dependent_mirrors
    has_one :pontuation


    enum situation: ['em_progresso','pendente', 'aprovado']
    enum gender: ['N/D', 'masculino', 'feminino']


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

    def set_clone_dependent
      @dependents = self.cadastre.dependents 
      @dependents.each do |dependent|
        @dependent = self.dependent_mirrors.new(dependent.attributes)
        @dependent.save
      end
    end

    def arrival_df_time(date)
      date.year - self.arrival_df.strftime("%Y").to_i if self.arrival_df.present?
    end

    def timelist_time(date)
      date.year - self.created_at.year
    end
  end
end
