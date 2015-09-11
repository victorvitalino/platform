module Person
  class Staff < ActiveRecord::Base


    default_scope { where(status: true)}

    has_one :user, as: :account, dependent: :destroy
    accepts_nested_attributes_for :user

    has_one :attendant, class_name: "Attendance::Attendant"

    has_many :permissions, class_name: "Person::StaffPermission"
    has_many :responsible, class_name: "Person:Sector"
    has_many :conducts, class_name: "Protocol::Conduct"

    belongs_to :sector_origin,   class_name: "Person::Sector"
    belongs_to :sector_current, class_name: "Person::Sector"

    belongs_to :job
    belongs_to :branch_line

    def self.search(search)
      query =  Staff.where(status: true)
      query =  query.where("sector_current_id = #{search[:sector]}")  if search[:sector].present?
      query
    end



#    validates_uniqueness_of :code, :rg, :cpf

#    validates :cpf, cpf: true
 #   validates_date :born, :before => lambda {18.years.ago}

    mount_uploader :avatar, Person::AvatarUploader
    mount_uploader :curriculum, Person::CurriculumUploader
  end
end
