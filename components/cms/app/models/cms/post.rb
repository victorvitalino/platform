module Cms
  class Post < ActiveRecord::Base

    
    belongs_to :post_category
    validates_presence_of :title, :content, :post_category, :date

    audited


    validates :thumb, :thumbnail, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :thumb, :thumbnail, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }
    
    mount_uploader :thumb, Archive::ImageUploader
    mount_uploader :thumbnail, Archive::ImageUploader
  end
end
