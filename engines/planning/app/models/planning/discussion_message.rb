module Planning
  class DiscussionMessage < ActiveRecord::Base
    belongs_to :author
  end
end
