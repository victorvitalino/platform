module Helpdesk
  class OrderService < ActiveRecord::Base
    belongs_to :sector
    belongs_to :branch_line, class_name: "Person::BranchLine"
    belongs_to :user, class_name: "Person::Staff"
    belongs_to :good, class_name: "Patrimony::Good"
    belongs_to :status

    has_many :monitor_service_orders, :dependent => :destroy
    accepts_nested_attributes_for :monitor_service_orders

<<<<<<< HEAD
    after_create  :update_os
    before_create :auto_increment
  	
=======
    after_create :update_os

>>>>>>> ddd45730304d2c9536d4476ae9de06558dc895ed
  	private

    def auto_increment
       max_num = OrderService.maximum(:number_increment)
       self.number_increment = max_num.to_i + 1
    end

    def update_os
    	os = OrderService.last
      number_os = os.created_at.year.to_s + os.created_at.month.to_s + os.number_increment.to_s
    	os.update(number: number_os.to_i, status_id: 1)
    end


  end
end
