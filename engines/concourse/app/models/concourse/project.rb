module Concourse
  class Project < ActiveRecord::Base
    belongs_to :project_category

    validates_presence_of :name, :description
  end
end
