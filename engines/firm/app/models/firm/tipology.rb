module Firm
  class Tipology < ActiveRecord::Base

   validates_presence_of :name, :home_type,:private_area, :income_family, :initial_value, :end_value

  end
end
