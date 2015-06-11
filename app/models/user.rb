class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthableasd
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        belongs_to :sector_origin, class_name: "Person::Sector"
        belongs_to :sector_current, class_name: "Person::Sector"

        belongs_to :jobs, class_name: "Person::Job"
        belongs_to :branch_lines, class_name: "Person::BranchLine"

        has_many :permissions, class_name: 'Person::UserPermisson'

  validates_presence_of :name, :code, :email, :rg, :rg_org, :blood_type,:avatar

  validates_cpf :cpf


  validates_date :born, :before => lambda {18.years.ago},
                                     :before_message => "Funcionário precisa ser maior de idade."

  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i

  mount_uploader :avatar, Person::AvatarUploader
  mount_uploader :curriculum, Person::CurriculumUploader

end
