module Candidate
  class CadastreAddress < ActiveRecord::Base
    belongs_to :unit, class_name: "Address::Unit"
    belongs_to :cadastre

    private


    def update_tables_sale(procedural, situation, status, status_unit)
         @cadastre_procedural = Candidate::CadastreProcedural.where(cadastre_id: self.cadastre_id).last

         @cadastre_procedurals = Candidate::CadastreProcedural.new
         @cadastre_procedurals.cadastre_mirror_id = @cadastre_procedural.cadastre_id
         @cadastre_procedurals.cadastre_id = @cadastre_procedural.cadastre_id
         @cadastre_procedurals.procedural_status_id = procedural
         @cadastre_procedurals.convocation_id = @cadastre_procedural.convocation_id
         @cadastre_procedurals.assessment_id = @cadastre_procedural.assessment_id
         @cadastre_procedurals.old_process = @cadastre_procedural.old_process
         @cadastre_procedurals.save

          if situation == 7
            @cadastre_situation = Candidate::CadastreSituation.new
            @cadastre_situation.cadastre_mirror_id = @cadastre_procedural.cadastre_id
            @cadastre_situation.cadastre_id = @cadastre_procedural.cadastre_id
            @cadastre_situation.situation_status_id = 7
            @cadastre_situation.save
          end

          @firms = Firm::EnterpriseCadastre.where(cadastre_id: self.cadastre_id).last

          @enterprise_status = Firm::EnterpriseStatus.new
          @enterprise_status.cadastre_id = @cadastre_procedural.cadastre_id
          @enterprise_status.enterprise_cadastre_id = @firms.id
          @enterprise_status.status_cadastre_id = status
          @enterprise_status.observation = self.observation
          @enterprise_status.save

          @unit = Address::Unit.find(self.unit_id)
          @unit.update(situation_unit_id: status_unit)

      end

  end
end
