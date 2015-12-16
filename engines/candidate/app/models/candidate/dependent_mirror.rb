module Candidate
  class DependentMirror < ActiveRecord::Base
    belongs_to :special_condition
#    enum gender: ['N/D', 'masculino', 'feminino']
  end
end
