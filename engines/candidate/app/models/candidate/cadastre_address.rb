module Candidate
  class CadastreAddress < ActiveRecord::Base
    belongs_to :unit, class_name: "Adress::Unit"

  end
end
