module Helpdesk
  class MonitorServiceOrder < ActiveRecord::Base

  	validates_presence_of :appointment

  	

    belongs_to :order_service
    belongs_to :staff, class_name: "Person::Staff"
    mount_uploader :attachment, ThumbnailUploader



  end
end
