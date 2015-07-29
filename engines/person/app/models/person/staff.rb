module Person
  class Staff < ActiveRecord::Base
    has_one :user, as: :account, dependent: :destroy
    accepts_nested_attributes_for :user

    has_many :permissions, class_name: "Person::StaffPermission"

    has_many :conducts, class_name: "Protocol::Conduct"

    belongs_to :sector_origin,   class_name: "Person::Sector"
    belongs_to :sector_current, class_name: "Person::Sector"

    belongs_to :job
    belongs_to :branch_line

    validates_uniqueness_of :code, :rg, :cpf

    validates :cpf, cpf: true
    validates_date :born, :before => lambda {18.years.ago}

    mount_uploader :avatar, Person::AvatarUploader
    mount_uploader :curriculum, Person::CurriculumUploader
  end
end
