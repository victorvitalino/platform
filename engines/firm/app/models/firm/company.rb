module Firm
  class Company < ActiveRecord::Base
    belongs_to :city
  end
end
