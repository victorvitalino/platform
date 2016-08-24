module Juridical
  class Defendant < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :legal_advice
  end
end
