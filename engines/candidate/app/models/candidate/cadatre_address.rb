module Candidate
  class CadatreAddress < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :cadastre_mirror
    belongs_to :unit
  end
end
