module Person
  class UserPermission < ActiveRecord::Base
    belongs_to :user, class_name: 'User'
    belongs_to :system_permission



  end
end
