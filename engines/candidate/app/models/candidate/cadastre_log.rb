module Candidate
  class CadastreLog < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :cadastre

    serialize :cadastre_old, Hash
    serialize :cadastre_new, Hash
  end
end
