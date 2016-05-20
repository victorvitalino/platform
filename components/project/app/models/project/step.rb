module Project
  class Step < ActiveRecord::Base
    belongs_to :enterprise

    has_many :allotments, class_name: "Indication::Allotment"

    validates :name, presence: true
    validates :demand, :rii, :rie, :old, :special, :vulnerable, numericality:  true, presence: true
  end
end
