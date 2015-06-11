module Patrimony
  class SerialNumber < ActiveRecord::Base
    belongs_to :patrimony
  end
end
