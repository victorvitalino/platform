module Entity
  class Member < ActiveRecord::Base
    belongs_to :member_job
    belongs_to :cadastre
    belongs_to :city, -> {federal_district}, class_name: "Address::City"
    has_many  :member_additionals
    
    audited
    
    validates :name, :rg, :rg_org, presence: true
    validates :cpf, cpf: true, presence: true
    validates_date :born, presence: true
    validates :telephone, presence:  true, numericality: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :member_job,presence: true
    #validates :certificate_civil_criminal, presence: true, on: :create 
    validates :cpf, uniqueness: { scope: :cadastre_id}, on: :create
    validate  :unique_cpf, on: :create

    attr_accessor :associated_entities

    accepts_nested_attributes_for :member_additionals, allow_destroy: true

    mount_uploader :certificate_civil_criminal, Entity::DocumentUploader
    mount_uploader :photo, Entity::DocumentUploader
        
    private

    def unique_cpf
      @member = Entity::Member.find_by_cpf(self.cpf) rescue nil
      errors.add(:cpf, "Este cpf já está vínculado em outra entidade") if @member.present?
    end
  end
end
