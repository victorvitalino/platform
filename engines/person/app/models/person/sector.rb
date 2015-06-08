module Person
  class Sector < ActiveRecord::Base

    has_many :subordinates, class_name: "Sector",foreign_key: "father_id"

    belongs_to :father, class_name: "Sector"
    belongs_to :responsible, class_name: "User"

    validates_presence_of :name, :acron



  end
end
