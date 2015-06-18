module Concourse
  class ProjectCategory < ActiveRecord::Base
    validates_presence_of :name
  end
end
