module Concourse
  class EnrollmentCandidate < ActiveRecord::Base
    belongs_to :enrollment
    belongs_to :candidate
    belongs_to :project

    serialize :properties, Hash

    validate :validate_properties

    private

    def validate_properties
      enrollment.enrollment_fields.each do |field|
        if field.required && properties[field.name].blank?
          #errors.add field.name, "must not be blank"
        end
      end
    end

  end
end
