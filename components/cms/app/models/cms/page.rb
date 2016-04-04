module Cms
  class Page < ActiveRecord::Base
    belongs_to :page_category

    extend FriendlyId
    
    scope :by_title, -> (title) { where("title ILIKE concat('%', ?, '%')", title)}
    scope :by_category, -> (category) { where(page_category_id: category)}
    scope :by_publish,  -> (publish) {where(publish: publish)}

    friendly_id :title, use: :slugged

    audited

    validates_presence_of :title, :content, :page_category, :date
    validates :thumb, :thumbnail, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :thumb, :thumbnail, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }
    
    mount_uploader :thumb, Archive::ImageUploader
    mount_uploader :thumbnail, Archive::ImageUploader


    def title_concat
      if self.page_category.present?
        "#{self.title} - #{self.page_category.title.humanize}" 
      else
        "#{self.title} - Sem categoria"
      end
    end

  end
end
