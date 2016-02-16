module Entity
  class Candidate < ActiveRecord::Base
    belongs_to :candidate, class_name: "Candidate::Cadastre"
    belongs_to :cadastre
  end
end
