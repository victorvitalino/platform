module Indication
  class Allotment < ActiveRecord::Base
    belongs_to :enterprise, -> { order(:id) }, class_name: "Project::Enterprise"

    attr_accessor :code, :password

    #validates :enterprise, :zone, :code, presence: true
    validates :demand, :rii, :rie, :old, :special, :vulnerable, presence: true, numericality: true
    #validates :password, presence: true
  end
end
