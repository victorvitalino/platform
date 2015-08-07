module Helpdesk
  class Attendant < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"


    enum type_attendant: {"infrastructure" => 0, "system" => 1}


  end
end
