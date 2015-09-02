module Cms
  class Page < ActiveRecord::Base
    belongs_to :page_category
    validates_presence_of :title, :content, :page_category, :date

    mount_uploader :thumb, ThumbUploader
    mount_uploader :thumbnail, ThumbnailUploader


    def title_concat
      if self.page_category.present?
        "#{self.title} - #{self.page_category.title.humanize}" 
      else
        "#{self.title} - Sem categoria"
      end
    end

  end
end
