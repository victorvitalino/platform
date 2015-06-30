module Helpdesk
  class OrderService < ActiveRecord::Base
    belongs_to :sector
    belongs_to :branch_line
    belongs_to :user
    belongs_to :good
    belongs_to :status
    has_many :monitor_service_orders , :dependent => :destroy
    accepts_nested_attributes_for :monitor_service_orders, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  end
end
