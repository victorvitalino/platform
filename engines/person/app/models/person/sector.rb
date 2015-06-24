module Person
  class Sector < ActiveRecord::Base

    has_many :subordinates, class_name: "Sector",foreign_key: "father_id"

    has_many :user

    belongs_to :father, class_name: "Sector"
    belongs_to :responsible, class_name: "User"

    has_many :branch_line

    validates_presence_of :name, :acron



  end
end
