module Entity
  class Member < ActiveRecord::Base
    belongs_to :member_job
    belongs_to :cadastre
    has_many  :member_additionals
    
    validates :name, :rg, :rg_org, presence: true
    validates :cpf, cpf: true, presence: true
    validates_date :born, presence: true
    validates :telephone, presence:  true, numericality: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :member_job, :certificate_civil_criminal, presence: true
    validates :cpf, uniqueness: { scope: :cadastre_id}
    validate  :unique_cpf

    attr_accessor :associated_entities

    accepts_nested_attributes_for :member_additionals, allow_destroy: true

    mount_uploader :certificate_civil_criminal, Entity::DocumentUploader
    mount_uploader :photo, Entity::DocumentUploader
        
    private

    def unique_cpf
        @member = Entity::Member.find_by_cpf(self.cpf) rescue nil
        if @member.present?
            errors.add(:cpf, "Este cpf já está vínculado na entidade #{@member.cadastre.acronym}")
        end
    end
  end
end
