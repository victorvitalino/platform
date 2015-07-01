module Helpdesk
  class OrderService < ActiveRecord::Base
    belongs_to :sector
    belongs_to :branch_line, class_name: "Person::BranchLine"
    belongs_to :user, class_name: "Person::Staff"
    belongs_to :good, class_name: "Patrimony::Good"
    belongs_to :status

    has_many :monitor_service_orders, :dependent => :destroy
    accepts_nested_attributes_for :monitor_service_orders

    after_create :update_os
  	
  	private
    def update_os
    	@os = OrderService.last
    	@os.update(number: @os.id, prefix: @os.created_at.year, status_id: 1)
    end


  end
end
