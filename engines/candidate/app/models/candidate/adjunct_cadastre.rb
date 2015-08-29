module Candidate
  class AdjunctCadastre < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :state, class_name: "Address::State"
    belongs_to :city, class_name: "Address::City"
    belongs_to :civil_state
    belongs_to :special_condition

    validates_presence_of :name, :civil_state,:special_condition,:cep, :address, :income


  end
end
