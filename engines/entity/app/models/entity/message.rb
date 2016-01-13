module Entity
  class Message < ActiveRecord::Base
    belongs_to :cadastre
  end
end
