module Concourse
  class Consult < ActiveRecord::Base

    belongs_to :project

    validates :content, length: { maximum: 2000 }, presence: true
    validates :terms_use, presence: true
  end
end
