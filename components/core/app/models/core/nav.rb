module Core
  class Nav < ActiveRecord::Base
    belongs_to :system_module , class_name: "Person::SystemModule"
    belongs_to :staff, class_name: "Person::Staff"
  end
end
