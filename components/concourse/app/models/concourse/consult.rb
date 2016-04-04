module Concourse
  class Consult < ActiveRecord::Base

    belongs_to :project

    scope :by_status, -> (status) { where(status: status)}
    
    validates :content, length: { maximum: 2000 }, presence: true
  end
end
