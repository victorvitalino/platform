module Firm
  class Enterprise < ActiveRecord::Base
    belongs_to :tipology
    belongs_to :company

    has_many :enterprise_cadastres
  end
end
