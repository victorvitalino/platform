module Concourse
  class Project < ActiveRecord::Base
    belongs_to :project_category
    
    has_many  :candidate_fields
    accepts_nested_attributes_for :candidate_fields, allow_destroy: true
    
    validates_presence_of :name, :description
  end
end
