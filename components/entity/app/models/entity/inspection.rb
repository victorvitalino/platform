module Entity
  class Inspection < ActiveRecord::Base
    belongs_to :cadastre_id
  end
end
