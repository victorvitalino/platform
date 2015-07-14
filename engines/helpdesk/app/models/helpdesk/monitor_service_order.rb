module Helpdesk
  class MonitorServiceOrder < ActiveRecord::Base

  	validates_presence_of :appointment

    belongs_to :order_service
    belongs_to :staff, class_name: "Person::Staff"
    mount_uploader :attachment, ThumbnailUploader

    after_create  :update_new_appointment_status

  	private

    def update_new_appointment_status
      os = OrderService.last
      mso = MonitorServiceOrder.last
      mso.update(staff_id: os.staff_id )
    end


  end
end
