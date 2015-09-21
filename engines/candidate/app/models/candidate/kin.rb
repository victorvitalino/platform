module Candidate
  class Kin < ActiveRecord::Base

    belongs_to :adjunct_cadastre
    belongs_to :special_condition
    belongs_to :kinship

    default_scope {where(status: true)}

    validates :name, :place_birth, presence: true
    validates_date :born
  
    validates :cpf, cpf: true, unless: :is_kid?
    validates :rg, :rg_org, :rg_uf, presence: true, unless: :is_kid?  

    validate  :unique_cpf?, unless: :is_kid?, on: :create
    validate  :cadastre_cpf?
      
    validates :percent, presence: true, numericality: true, if: :copurchaser?
    validates :income,  numericality: {only_float: true}

   # validates_presence_of :cpf, :if => :old?

   #def old?
    # old = advance(:born => -18)
    # old >= 18
   #end

   private

   def unique_cpf?
     if adjunct_cadastre.kins.where(cpf: self.cpf, status: true).present?
        errors.add(:cpf, 'cpf já cadastrado')
     end
   end

   def cadastre_cpf?
      if adjunct_cadastre.cadastre.cpf == self.cpf
        errors.add(:cpf, 'o cpf do dependente não pode ser igual o do titular')
      end
   end

   def copurchaser?
    self.copurchaser_flag.present?
   end
   
   def is_kid?
    if self.born.present? 
      (Time.now - 18.years) < self.born
    end
   end

  end
end
