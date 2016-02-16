module Candidate
  class DependentMirror < ActiveRecord::Base
    belongs_to :special_condition
    enum gender: ['N/D', 'masculino', 'feminino']

    def age
      Date.today.strftime('%Y').to_i - self.born.strftime('%Y').to_i
    end

    def special?
      (self.special_condition_id != 1) ? "Com Condição Especial" : "Sem Condição Especial"
    end
  end
end
