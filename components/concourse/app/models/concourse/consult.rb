module Concourse
  class Consult < ActiveRecord::Base

    belongs_to :project

    validates :content, length: { maximum: 2000 }, presence: true
  end
end
