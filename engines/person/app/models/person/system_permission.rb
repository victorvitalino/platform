module Person
  class SystemPermission < ActiveRecord::Base
    belongs_to :system
    audited
    
    validates_presence_of :action, :code, :system

    scope :permissions_tree, -> {SystemPermission.joins(:system)}

  end
end
