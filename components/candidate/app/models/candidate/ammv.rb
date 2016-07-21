module Candidate
  class Ammv < ActiveRecord::Base

    def set_cdru(tcu)
      
      if self.cdru == "SIM"
        "Incluso na CDRU"
      else 
        if tcu.nil?
          "Sem registro na CODHAB"
        else
          "Não"
        end
      end 
    end
  end
end
