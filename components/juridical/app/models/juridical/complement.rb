module Juridical
  class Complement < ActiveRecord::Base

   attr_accessor :instancy

    belongs_to :document_type, class_name: "Protocol::DocumentType"
    belongs_to :lawsuit
    belongs_to :instancy_place
    belongs_to :responsible_lawyer, foreign_key: "staff_id", class_name: "Person::Staff"
    belongs_to :advice_type
    belongs_to :complement_father_id, foreign_key: "id", class_name: "Juridical::Complement"
    belongs_to :legal_advice
    belongs_to :staff, class_name: "Person::Staff"
  end
end
