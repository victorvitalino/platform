module Entity
  class OldCandidate < ActiveRecord::Base
    belongs_to :old
    belongs_to :cadastre, class_name: 'Candidate::Cadastre'


  end
end
