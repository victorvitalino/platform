module Concourse
  class EnrollmentField < ActiveRecord::Base
    belongs_to :enrollment

    enum :field_type => [:text, :boolean, :file]
    validates_presence_of :name, :field_type
    validates_numericality_of :length, allow_blank: true

  end
end
