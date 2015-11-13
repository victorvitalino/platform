module Person
  class System < ActiveRecord::Base
    has_many :system_permissions
    audited
    
    validates_presence_of :name, :code
    validates :name, :code, uniqueness: true

  end
end
