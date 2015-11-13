module Firm
  class UserCompany < ActiveRecord::Base
    belongs_to :company
  end
end
