module Helpdesk
  class OrderService < ActiveRecord::Base


    belongs_to :branch_line, class_name: "Person::BranchLine"
    belongs_to :sector, class_name: "Person::Sector"
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :opened_by, class_name: "Person::Staff"
    belongs_to :responsible, class_name: "Person::Staff"
    belongs_to :good, class_name: "Patrimony::Good"
    has_many   :monitor_service_orders



    accepts_nested_attributes_for :monitor_service_orders

    validates_presence_of :branch_line_id, :staff_id, :good_id, :subject, :type, :status

    enum :types => [:systems, :infrastructure]
    enum :status => [:open, :in_progress, :solved, :closed, :reopened]


    after_create  :update_os, :set_user_monitor_service
    before_create :auto_increment



  	private

    def auto_increment
       max_num = OrderService.maximum(:number_increment)
       self.number_increment = max_num.to_i + 1
    end

    def update_os
    	os = OrderService.last
      number_os = os.created_at.year.to_s + os.created_at.month.to_s + os.number_increment.to_s
    	os.update(number: number_os.to_i)
    end

    def set_user_monitor_service
      os = OrderService.last
      mso = MonitorServiceOrder.last
      mso.update(staff_id: os.staff_id )
    end


  end
end
