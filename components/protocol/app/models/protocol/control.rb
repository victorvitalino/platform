module Protocol
  class Control < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :staff, class_name: "Person::Staff"

    attr_accessor :document_number, :document_type

    has_many :control_routes
    has_many :control_interesteds

  end
end
