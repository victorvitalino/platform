module Planning
  class Problem < ActiveRecord::Base
    belongs_to :responsible
  end
end
