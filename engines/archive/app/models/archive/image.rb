module Archive
  class Image < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"

    validates :original_name, presence: true, uniqueness: true

    
    validates :file_path, presence: true
    validates :file_path, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :file_path, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }

    mount_uploader :file_path, Archive::ImageUploader 
  end
end
