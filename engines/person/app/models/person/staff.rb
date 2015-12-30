module Person
  class Staff < ActiveRecord::Base

    audited

    scope :status, -> (status = true) {where(status: status)}
    scope :sector, -> sector_current_id {where(sector_current_id: sector_current_id)}

    has_one :user, as: :account, dependent: :destroy
    accepts_nested_attributes_for :user

    has_one :attendant, class_name: "Attendance::Attendant"
    has_one :helpdesk_attendant, class_name: "Helpdesk::TicketAttendant"

    has_many :permissions, class_name: "Person::StaffPermission"
    has_many :responsible, class_name: "Person:Sector"
    has_many :conducts, class_name: "Protocol::Conduct"

    belongs_to :sector_origin,   class_name: "Person::Sector"
    belongs_to :sector_current, class_name: "Person::Sector"

    belongs_to :job
    belongs_to :branch_line

    validates_uniqueness_of :code

    validates :cpf, cpf: true, on: :create
    validates_date :born, :before => lambda {18.years.ago}

    mount_uploader :avatar, Person::AvatarUploader
    mount_uploader :personal_image, Person::AvatarUploader
    mount_uploader :curriculum, Person::CurriculumUploader

    
  end
end
