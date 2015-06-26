module Concourse
  class Enrollment < ActiveRecord::Base
    belongs_to :project
    has_many :enrollment_fields
    has_many :enrollment_candidates
    
    validates_presence_of :title, :description, :start, :end
    validates :value_fee, numericality: {only_float: true}, presence: true, if: :fee?

    private

    def fee?
      self.fee
    end
  end
end
