module Entity
  class Member < ActiveRecord::Base
    belongs_to :member_job
    has_many  :member_additionals
    
    validates :name, :rg, :rg_org, presence: true
    validates :cpf, cpf: true, presence: true
    validates_date :born, presence: true
    validates :telephone, presence:  true, numericality: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :member_job, :certificate_civil_criminal, presence: true
    validates :photo, presence: true
    validates :cpf, uniqueness: { scope: :cadastre_id}

    attr_accessor :associated_entities

    accepts_nested_attributes_for :member_additionals, allow_destroy: true

    mount_uploader :certificate_civil_criminal, Entity::DocumentUploader
    mount_uploader :photo, Entity::DocumentUploader
  end
end
