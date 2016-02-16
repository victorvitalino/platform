module Planning
  class Discussion < ActiveRecord::Base
    belongs_to :author
    belongs_to :project
  end
end
