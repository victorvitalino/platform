module Action
  class Inscription < ActiveRecord::Base
    belongs_to :social_event
    belongs_to :cadastre
  end
end
