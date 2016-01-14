require 'carrierwave/orm/activerecord'
module Cms
  class Gallery < ActiveRecord::Base
  validates_presence_of :title,:date
  mount_uploaders :photo, ThumbUploader
  mount_uploader :thumbnail, ThumbUploader
  end
end
