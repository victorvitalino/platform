module Sefaz
  class TransmissionCandidate < ActiveRecord::Base
    belongs_to :transmission

    enum status: ['aguardando', 'recusado', 'ato_gerado']
  end
end
