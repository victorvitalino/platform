module Concourse
  class Project < ActiveRecord::Base

    extend FriendlyId
  
    friendly_id :title, use: :slugged
    
    default_scope { where(publish: true) }
    
    has_many :pages
    has_many :navs
      
    validates_presence_of :title, :mini_description, :apresentation, :image_logo
    validates_date :start, before: :end, presence: true
    validates_date :end, after: :start, presence: true

    mount_uploader :image_logo,   ImageUploader
    mount_uploader :image_header, ImageUploader
    mount_uploader :image_footer, ImageUploader
    mount_uploader :image_slider, ImageUploader
  end
end
