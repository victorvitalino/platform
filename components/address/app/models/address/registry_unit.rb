module Address
  class RegistryUnit < ActiveRecord::Base

    belongs_to :unit


    enum situation: [:não, :em_fase, :sim]



  end
end
