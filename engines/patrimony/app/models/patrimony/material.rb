module Patrimony
  class Material < ActiveRecord::Base
    belongs_to :type_material
  end
end
