module Entity
  class Inspection < ActiveRecord::Base
    belongs_to :cadastre
    scope :by_cnpj,          -> (value) { where(cnpj: value) }
    scope :by_name,         -> (value) { where("name ILIKE '%#{value}%'") }
    validates :general_photo_1, :general_photo_2, :general_photo_3,:documentation_photo_1,:documentation_photo_2,:responsible_photo, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :general_photo_1, :general_photo_2, :general_photo_3,:documentation_photo_1,:documentation_photo_2,:responsible_photo, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }

    mount_uploader :general_photo_1, Archive::ImageUploader
    mount_uploader :general_photo_2, Archive::ImageUploader
    mount_uploader :general_photo_3, Archive::ImageUploader
    mount_uploader :documentation_photo_1, Archive::ImageUploader
    mount_uploader :documentation_photo_2, Archive::ImageUploader
    mount_uploader :responsible_photo, Archive::ImageUploader

    enum property_type: ["comercial", "residencial"]
    enum occupied_property: ["entidade_original","outra_entidade","outros"]
  end
end
