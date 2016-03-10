require 'carrierwave/orm/activerecord'
module Cms
  class Gallery < ActiveRecord::Base
  validates_presence_of :title


 # validates :photo, :thumbnail
  validates :photo, :thumbnail, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
  #validates :photo, :thumbnail, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              #message: 'Somente arquivos .jpg ou .png' }

  mount_uploaders :photo, Archive::ImageUploader
  mount_uploader  :thumbnail, Archive::ImageUploader
  end
end
