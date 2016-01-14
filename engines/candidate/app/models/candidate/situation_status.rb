module Candidate
  class SituationStatus < ActiveRecord::Base
    enum status: ['ok', 'pendente','cinza','nao_sabemos']
  end
end
