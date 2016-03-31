module Candidate
  class CadastreProcedural < ActiveRecord::Base
    belongs_to :procedural_status
    belongs_to :convocation
    belongs_to :cadastre

  private

    def self.create_procedural(mirror_id, cadastre_id, procedural_status,convocation,assessment, process)
         @cadastre_procedurals = Candidate::CadastreProcedural.new
         @cadastre_procedurals.cadastre_mirror_id = mirror_id
         @cadastre_procedurals.cadastre_id = cadastre_id
         @cadastre_procedurals.procedural_status_id = procedural_status
         @cadastre_procedurals.convocation_id = convocation
         @cadastre_procedurals.assessment_id = assessment
         @cadastre_procedurals.old_process = process
         @cadastre_procedurals.save
    end


  end
end
