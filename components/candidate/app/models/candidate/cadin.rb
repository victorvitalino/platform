module Candidate
  class Cadin < ActiveRecord::Base
    belongs_to :occurrence_cadin
    belongs_to :signed_instrument
    belongs_to :city, class_name: "Address::City"

    scope :name_candidate,   -> (name_candidate) { where(name: name_candidate) }
    scope :cpf,          -> (cpf) { where(cpf: cpf) }

  end
end
