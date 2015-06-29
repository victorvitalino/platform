module Concourse
  class EnrollmentCandidate < ActiveRecord::Base
    belongs_to :enrollment
    belongs_to :candidate
    belongs_to :project

    serialize :properties, Hash
    attr_accessor :attributes_values 

    validate :attributes_validate

    private

    def attributes_validate
      enrollment.enrollment_fields.each do |field|
        if field.required && attributes_values[field.name].blank?
          errors.add field.name, "must not be blank"
        end
      end
    end
  end
end
