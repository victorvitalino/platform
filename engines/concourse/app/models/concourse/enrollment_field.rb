module Concourse
  class EnrollmentField < ActiveRecord::Base
    belongs_to :enrollment

    default_scope { where(status: true) } 
    enum :field_type => [:text, :boolean, :file]
    validates_presence_of :name, :field_type, :code
  end
end
