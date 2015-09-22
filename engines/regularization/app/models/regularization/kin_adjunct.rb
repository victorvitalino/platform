module Regularization
  class KinAdjunct < Candidate::KinAdjunct
    belongs_to :kin

    belongs_to :civil_state, class_name: "Candidate::CivilState"
    belongs_to :kinship, class_name: "Candidate::Kinship"

  end
end