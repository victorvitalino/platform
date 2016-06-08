module Indication
  class Allotment < ActiveRecord::Base
    belongs_to :step, -> { order(:id) }, class_name: "Project::Step"

    attr_accessor :code, :password

    #validates :enterprise, :zone, :code, presence: true
    validates :demand, :rii, :rie, :old, :special, :vulnerable, presence: true, numericality: true

    def created_at_formated
      self.created_at.strftime('%d/%m/%Y')
    end
  end
end
