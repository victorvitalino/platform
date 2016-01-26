module Cms
  class Post < ActiveRecord::Base

    include Bootsy::Container

    
    belongs_to :post_category
    validates_presence_of :title, :content, :post_category, :date

    audited

    
    mount_uploader :thumb, ThumbUploader
    mount_uploader :thumbnail, ThumbnailUploader
  end
end
