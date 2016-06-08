module Candidate
  class EnterpriseSituationStatus < ActiveRecord::Base
    has_many :enterprise_cadastre_situation
  end
end
