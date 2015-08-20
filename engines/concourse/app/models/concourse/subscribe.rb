module Concourse
  class Subscribe < ActiveRecord::Base
    belongs_to :project
    belongs_to :bank_slip
    has_many :fields

    validates_presence_of :title

    validates_date :start, before: :end,  presence: true 
    validates_date :end,   after: :start, presence: true

    validates :bank_slip, presence: true, if: :fee?

    accepts_nested_attributes_for :fields, allow_destroy: true


    private

    def fee?
      self.fee
    end 
  end
end
