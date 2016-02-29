module Juridical
  class Lawsuit < ActiveRecord::Base

    validates_presence_of :name

  end
end
