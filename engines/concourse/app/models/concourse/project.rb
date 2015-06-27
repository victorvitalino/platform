module Concourse
  class Project < ActiveRecord::Base
    belongs_to :project_category

    has_many :pages
    has_many :navs
    has_many :enrollments
        
        
    validates_presence_of :name, :start, :end
    validates_date :start, before: :end

    mount_uploader :header, Concourse::ImageUploader
    mount_uploader :footer, Concourse::ImageUploader
    mount_uploader :logo, Concourse::ImageUploader


  end
end
