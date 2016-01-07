module Candidate
  class CadastreAddress < ActiveRecord::Base
    belongs_to :unit, class_name: "Adress::Unit"
    #belongs_to :cadastres
  end
end
