class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthableasd
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :sector_origin,       class_name: "Person::Sector"
  belongs_to :sector_current,      class_name: "Person::Sector"
  belongs_to :job,                class_name: "Person::Job"
  belongs_to :branch_line,        class_name: "Person::BranchLine"

  has_many :permissions,           class_name: 'Person::UserPermisson'

 # validates_presence_of :name, :code, :email, :rg, :rg_org, :born, :date_contract, :sector_current, :job_id
  validates_uniqueness_of :code, :rg, :cpf

  validates :cpf, cpf: true
  validates_date :born, :before => lambda {18.years.ago}

  mount_uploader :avatar, Person::AvatarUploader
  mount_uploader :curriculum, Person::CurriculumUploader

  after_create :notification_create_account

  private

  def notification_create_account
    #create new ticket on helpdesk
  end
end
