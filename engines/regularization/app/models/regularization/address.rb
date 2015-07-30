module Regularization
  class Address
    include ActiveModel::Model

    attr_accessor :city, :block, :group, :unit, :id


    validates_presence_of :city, :block, :group, :unit, :id

  end
end