module Juridical
  class AdviceType < ActiveRecord::Base

    validates_presence_of :name

  end
end
