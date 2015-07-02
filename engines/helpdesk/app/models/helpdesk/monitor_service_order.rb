module Helpdesk
  class MonitorServiceOrder < ActiveRecord::Base
    belongs_to :order_service
    mount_uploader :attachment, ThumbnailUploader
  end
end
