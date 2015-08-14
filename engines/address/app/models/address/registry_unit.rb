module Address
  class RegistryUnit < ActiveRecord::Base
    belongs_to :unit

#    enum situation: [:no_registry, :registring, :registred]
    
  end
end
