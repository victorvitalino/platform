module Concourse
  class Participation < ActiveRecord::Base
    belongs_to :project
    belongs_to :subscribe

    validates :archive_one, :archive_two, :archive_three, presence: true

  end
end
