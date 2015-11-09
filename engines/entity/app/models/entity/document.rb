module Entity
  class Document < ActiveRecord::Base
    belongs_to :document_category

    validates :document_category, :archive_path, presence: true

    validates :document_category, uniqueness: { scope: [:cadastre_id]}

    mount_uploader :archive_path, Entity::DocumentUploader
  end
end
