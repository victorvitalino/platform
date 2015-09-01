module Candidate
  class Checklist < ActiveRecord::Base
    belongs_to :checklist_type
  end
end
