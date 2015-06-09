module Person
  class System < ActiveRecord::Base

    validates_presence_of :name, :code
    validates :name, :code, uniqueness: true
    has_many :system_permissions

  end
end
