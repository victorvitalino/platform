module Patrimony
  class Drive < ActiveRecord::Base
    belongs_to :sector, class_name: "Person::Sector"
    belongs_to :user, class_name: "Person:User"
    belongs_to :good
  end
end
