module Juridical
  class Instancy < ActiveRecord::Base

    has_many :instancy_places

    validates_presence_of :name

  end
end
