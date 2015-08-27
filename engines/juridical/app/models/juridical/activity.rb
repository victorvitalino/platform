module Juridical
  class Activity < ActiveRecord::Base
    belongs_to :document_type, class_name: "Protocol::DocumentType"
    belongs_to :action_type
    belongs_to :local_instance
    belongs_to :user, class_name: "Person::Staff"
  end
end
