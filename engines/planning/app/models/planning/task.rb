module Planning
  class Task < ActiveRecord::Base
    belongs_to :project
    belongs_to :responsible
    belongs_to :author
  end
end
