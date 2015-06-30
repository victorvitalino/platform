module Helpdesk
  class Qualification < ActiveRecord::Base
    belongs_to :order_service
  end
end
