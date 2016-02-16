module Concourse
  class Subscribe < ActiveRecord::Base
    belongs_to :project
    belongs_to :type_guide, class_name: "Brb::Category"

    has_many :fields
    has_many :candidates

    validates_presence_of :title

    validates_date :start, before: :end,  presence: true 
    validates_date :end,   after: :start, presence: true

    validates :type_guide, presence: true, if: :fee?

    accepts_nested_attributes_for :fields, allow_destroy: true

  end
end
