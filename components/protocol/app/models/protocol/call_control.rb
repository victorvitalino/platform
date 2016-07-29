module Protocol
  class CallControl < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :assessment
  end
end
