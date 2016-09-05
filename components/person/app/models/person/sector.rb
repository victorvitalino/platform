module Person
  class Sector < ActiveRecord::Base

    audited

    default_scope { order(:name) }

    scope :status, -> (status = true) { where(:status => status) }

    has_many :subordinates, class_name: "Sector", foreign_key: "father_id"
    has_many :staffs, foreign_key: "sector_current_id"

    belongs_to :father, class_name: "Person::Sector", foreign_key: 'father_id'
    belongs_to :responsible, class_name: "Person::Staff", foreign_key: 'responsible_id'

    has_many :branch_line

    has_many :tickets, class_name: "Helpdesk::Ticket"

    has_many :assessments, class_name: "Protocol::Assessment"

    has_many :conducts, class_name: "Protocol::Conduct"


   validates_presence_of :name, :acron,:prefex
   validates_uniqueness_of :name



  end
end
