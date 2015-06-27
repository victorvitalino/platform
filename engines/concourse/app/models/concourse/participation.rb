module Concourse
  class Participation < ActiveRecord::Base
    belongs_to :project

    default_scope { where(status: true)}
        
    validates_presence_of :title, :description, :start, :end
    validates_date :start, before: :end

  end
end
