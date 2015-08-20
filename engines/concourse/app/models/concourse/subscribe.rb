module Concourse
  class Subscribe < ActiveRecord::Base
    belongs_to :project
    belongs_to :type_slip, class_name: "Finance::TypeSlip"

    has_many :fields

    validates_presence_of :title

    validates_date :start, before: :end,  presence: true 
    validates_date :end,   after: :start, presence: true

    validates :type_slip, presence: true, if: :fee?

    accepts_nested_attributes_for :fields, allow_destroy: true


    private

    def fee?
      self.fee
    end 
  end
end
