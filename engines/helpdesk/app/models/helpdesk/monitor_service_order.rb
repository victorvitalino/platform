module Helpdesk
  class MonitorServiceOrder < ActiveRecord::Base
    belongs_to :order_service
    
  end
end
