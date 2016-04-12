module Juridical
  class TjReturn
    include ActiveModel::Model
    attr_accessor :date_action, :progress, :complement
  end
end
