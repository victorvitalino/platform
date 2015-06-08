class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        belongs_to :sector_origin, class_name: "Person::Sector"
        belongs_to :sector_current, class_name: "Person::Sector"
end
