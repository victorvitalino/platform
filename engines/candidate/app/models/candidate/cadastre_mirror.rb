module Candidate
  class CadastreMirror < ActiveRecord::Base
    belongs_to :special_condition
    has_many :dependent_mirrors
  end
end
