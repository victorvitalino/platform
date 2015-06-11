module Patrimony
  class Good < ActiveRecord::Base
    belongs_to :sector
    belongs_to :user
    belongs_to :material
    belongs_to :property
  end
end
