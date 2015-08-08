module Cms
  class Page < ActiveRecord::Base
    belongs_to :page_category
    validates_presence_of :title, :content, :page_category, :date

    mount_uploader :thumb, ThumbUploader
    mount_uploader :thumbnail, ThumbnailUploader
    end
end
