module Cms
  class Post < ActiveRecord::Base


    belongs_to :post_category
    validates_presence_of :title, :content, :post_category, :date

    audited

    scope :by_title, -> (title) { where("title ILIKE concat('%', ?, '%')", title)}
    scope :by_category, -> (category) { where(post_category_id: category)}
    scope :by_publish,  -> (publish) {where(publish: publish)}

    validates :thumb, :thumbnail, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :thumb, :thumbnail, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }

    validates :thumb, presence: true, if: :slider?
    validates :thumbnail, presence: true, if: :internal_image?


    mount_uploader :thumb, Archive::ImageUploader
    mount_uploader :thumbnail, Archive::ImageUploader
    
    private

    def slider?
      self.slider.present?
    end

    def internal_image?
      self.active_photo.present?
    end
  end
end
