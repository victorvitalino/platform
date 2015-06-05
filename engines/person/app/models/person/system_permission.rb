module Person
  class SystemPermission < ActiveRecord::Base
    belongs_to :system
  end
end
