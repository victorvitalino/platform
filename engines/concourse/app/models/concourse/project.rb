module Concourse
  class Project < ActiveRecord::Base
    belongs_to :project_category
    has_many  :candidate_fields
    
    validates_presence_of :name, :start, :end

    mount_uploader :background, Concourse::BackgroundUploader
    mount_uploader :logo, Concourse::LogoUploader


  end
end
