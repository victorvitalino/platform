module Patrimony
  class TypeMaterial < ActiveRecord::Base
  	 validates_presence_of :name, :description, :percentage, :life_cycle, :status
  end
end
