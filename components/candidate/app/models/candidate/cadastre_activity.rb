module Candidate
  class CadastreActivity < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :staff

    enum type_activity:   ['simples', 'judicial','crítico', 'corretiva', 'sistema']
    enum type_ocurrency:  ['impeditivo', 'informativo', 'corretivo']
  end
end
