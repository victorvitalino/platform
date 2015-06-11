module Patrimony
  class Drive < ActiveRecord::Base
    belongs_to :sector
    belongs_to :user
    belongs_to :good
  end
end
