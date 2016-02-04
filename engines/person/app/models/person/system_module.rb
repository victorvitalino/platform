module Person
  class SystemModule < ActiveRecord::Base
    has_many :systems
    has_many :system_permissions, through: :systems
  end
end
