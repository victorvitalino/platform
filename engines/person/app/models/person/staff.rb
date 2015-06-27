module Person
  class Staff < ActiveRecord::Base
    has_one :user, as: :account, dependent: :destroy
    has_many :permissions, class_name: "Person::UserPermission", foreign_key: 'user_id'
    mount_uploader :avatar, Person::AvatarUploader
  end
end
