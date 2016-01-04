module Planning
  class Project < ActiveRecord::Base
    belongs_to :sector
  end
end
