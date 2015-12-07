require 'carrierwave/orm/activerecord'
module Cms
  class Gallery < ActiveRecord::Base

  mount_uploaders :photo, ThumbUploader
  mount_uploader :thumbnail, ThumbUploader
  end
end
