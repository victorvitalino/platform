module Juridical
  class InstancyPlace < ActiveRecord::Base
    belongs_to :instancy
    validates_presence_of :name
  end
end
