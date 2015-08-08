module Patrimony
  class Material < ActiveRecord::Base
    belongs_to :type_material
    validates_presence_of :name, :description, :type_material
  end
end
