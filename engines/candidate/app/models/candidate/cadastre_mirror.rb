module Candidate
  class CadastreMirror < ActiveRecord::Base
    belongs_to :special_condition
  end
end
