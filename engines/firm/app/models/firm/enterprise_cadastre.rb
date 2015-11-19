module Firm
  class EnterpriseCadastre < ActiveRecord::Base
    belongs_to :enterprise
    belongs_to :cadastre
    belongs_to :status_cadastre
  end
end
