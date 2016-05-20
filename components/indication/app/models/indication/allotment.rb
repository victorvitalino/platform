module Indication
  class Allotment < ActiveRecord::Base
    belongs_to :step, -> { order(:id) }, class_name: "Project::Step"

    attr_accessor :code, :password

    validates :enterprise, :zone, :code, presence: true
    validates :demand, :rii, :rie, :old, :special, :vulnerable, presence: true, numericality: true
    validates :password, presence: true


    def step_demand_allow
      demand = step.allotments.sum(:demand) 
      demand = step.demand if demand == 0 
    end

    def step_demand_deny
      0
    end
  end
end
