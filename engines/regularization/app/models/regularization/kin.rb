module Regularization
  class Kin < Candidate::Kin
    belongs_to :adjunct_cadastre
    has_many :kin_adjuncts  
    
    accepts_nested_attributes_for :kin_adjuncts
  end
end