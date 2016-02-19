module Entity
  class Document < ActiveRecord::Base

    belongs_to :document_category

    scope :general,   ->  { joins(:document_category).where('entity_document_categories.document_type = 0')                         }
    scope :tecnical,  ->  { joins(:document_category).where('entity_document_categories.document_type = 1')                         }
    
    validates :document_category, :archive_path, presence: true
    validates :document_category, uniqueness: { scope: [:cadastre_id]}

    scope :required, -> {joins(:document_category).where('entity_document_categories.document_type = 0')}
    scope :tecnical, -> {joins(:document_category).where('entity_document_categories.document_type = 1')}

    attr_accessor :document_type
    
    mount_uploader :archive_path, Entity::DocumentUploader
  end
end
