module Firm
  class Enterprise < ActiveRecord::Base
    belongs_to :tipology
    belongs_to :company
  end
end
