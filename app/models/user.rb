class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        belongs_to :sector_origin, class_name: "Person::Sector"
        belongs_to :sector_current, class_name: "Person::Sector"

  validates_presence_of :name, :code, :email, :cpf, :rg, :rg_org, :blood_type
  validates_presence_of :encrypted_password, :status, :avatar

  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]+\z/i

  #mount_uploader :avatar, AvatarUploader
end
