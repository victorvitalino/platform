module Candidate
  class Deallocate

    include ActiveModel::Model
    attr_accessor :cadastre_id, :unit_id, :procedural, :status_cadastre, :observation

     validates :procedural,:status_cadastre, :observation, presence: true

  end
end
