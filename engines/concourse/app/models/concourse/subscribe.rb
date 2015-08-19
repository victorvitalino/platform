module Concourse
  class Subscribe < ActiveRecord::Base
    belongs_to :project
    belongs_to :bank_slip
  end
end
