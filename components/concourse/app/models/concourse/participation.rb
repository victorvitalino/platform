module Concourse
  class Participation < ActiveRecord::Base
    belongs_to :project
    belongs_to :subscribe

    validates :team_description, :archive_one, :archive_two,
              :archive_three,:archive_four,:archive_five, presence: true

  end
end
