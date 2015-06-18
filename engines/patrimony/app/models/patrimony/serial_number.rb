module Patrimony
  class SerialNumber < ActiveRecord::Base
    belongs_to :good
  end
end
