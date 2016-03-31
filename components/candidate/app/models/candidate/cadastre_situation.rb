module Candidate
  class CadastreSituation < ActiveRecord::Base
    belongs_to :situation_status
    belongs_to :cadastre

    private

    def self.create_status(mirror_id, cadastre_id, situation_status)
         @cadastre_situation = Candidate::CadastreSituation.new
         @cadastre_situation.cadastre_mirror_id = mirror_id
         @cadastre_situation.cadastre_id = cadastre_id
         @cadastre_situation.situation_status_id = situation_status
         @cadastre_situation.save
    end


  end
end
