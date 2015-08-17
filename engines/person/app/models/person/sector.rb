module Person
  class Sector < ActiveRecord::Base

    has_many :subordinates, class_name: "Sector",foreign_key: "father_id"
    has_many :staffs, foreign_key: "sector_current_id"

    belongs_to :father, class_name: "Sector", foreign_key: 'father_id'
    belongs_to :responsible, class_name: "Staff", foreign_key: 'id'

    has_many :branch_line

    has_many :assessments, class_name: "Protocol::Assessment"

    has_many :conducts, class_name: "Protocol::Conduct"


    validates_presence_of :name, :acron,:prefex



  end
end
