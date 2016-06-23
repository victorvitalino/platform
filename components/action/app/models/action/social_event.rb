module Action
  class SocialEvent < ActiveRecord::Base
    belongs_to :city,class_name: 'Address::City'
    enum situation: ["concluido","em breve","inscreva-se"]
    validates :thumb, :photo, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :thumb, :photo, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }

    validates :thumb, presence: true
    validates :photo, presence: true


    mount_uploader :thumb, Archive::ImageUploader
    mount_uploader :photo, Archive::ImageUploader
  end
end
