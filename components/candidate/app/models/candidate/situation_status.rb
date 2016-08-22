module Candidate
  class SituationStatus < ActiveRecord::Base
    enum status: ['ok', 'pendente','cinza','nao_sabemos']

    validates :name, presence: true, uniqueness: true
    validates :code, uniqueness: true

  end
end
