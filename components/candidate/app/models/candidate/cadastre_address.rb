module Candidate
  class CadastreAddress < ActiveRecord::Base
    belongs_to :unit, class_name: "Address::Unit"
    belongs_to :cadastre
    belongs_to :cadastre_procedural



    enum status: ['reserva', 'distribuído', 'distrato','transferencia', 'permuta']

    scope :cpf,  -> (cpf) {joins(:cadastre).where('candidate_cadastres.cpf = ?', cpf)}
    scope :old_process,  -> (old_process) { joins("inner join candidate_cadastre_procedurals on candidate_cadastre_procedurals.cadastre_id = candidate_cadastre_addresses.cadastre_id").where('candidate_cadastre_procedurals.old_process = ?', old_process)}
    scope :address,  -> (id) {joins(:unit).where('address_units.id = ?', id)}

    scope :contemplateds, -> {
      self.joins('INNER JOIN general_pontuations AS point
                  ON point.id = candidate_cadastre_addresses.cadastre_id
                  inner join address_units as unit
                  on unit.id = candidate_cadastre_addresses.unit_id')
                  .where('point.situation_status_id IN(7,14) and candidate_cadastre_addresses.situation_id = 1
                  and unit.situation_status_id = 3')
    }


    def self.update_tables_sale(cadastre_id, unit, situation, status, status_unit, firm_user, observation)
         @cadastre_procedural = Candidate::CadastreProcedural.where(cadastre_id: cadastre_id).last

         @cadastre_procedurals = Candidate::CadastreProcedural.new
         @cadastre_procedurals.cadastre_mirror_id = @cadastre_procedural.cadastre_id
         @cadastre_procedurals.cadastre_id = @cadastre_procedural.cadastre_id
         @cadastre_procedurals.procedural_status_id = procedural
         @cadastre_procedurals.convocation_id = @cadastre_procedural.convocation_id
         @cadastre_procedurals.assessment_id = @cadastre_procedural.assessment_id
         @cadastre_procedurals.old_process = @cadastre_procedural.old_process
         @cadastre_procedurals.observation = observation
         @cadastre_procedurals.transfer_process = @cadastre_procedural.transfer_process
         @cadastre_procedurals.transfer_assessment_id = @cadastre_procedural.transfer_assessment_id
         @cadastre_procedurals.save

          if situation == 7
            @cadastre_situation = Candidate::CadastreSituation.new
            @cadastre_situation.cadastre_id = cadastre_id
            @cadastre_situation.situation_status_id = 7
            @cadastre_situation.save
          end

          @firms = Candidate::EnterpriseCadastre.where(cadastre_id: cadastre_id).last

          @enterprise_status = Candidate::EnterpriseCadastreSituation.new
          @enterprise_status.cadastre_id = cadastre_id
          @enterprise_status.enterprise_cadastre_id = @firms.id
          @enterprise_status.enterprise_cadastre_status_id = status
          @enterprise_status.observation = observation
          @enterprise_status.firm_user_id = user
          @enterprise_status.save

          @unit = Address::Unit.find(unit)
          @unit.update(situation_unit_id: status_unit)

      end

    private


    def get_dominial_chain(unit, cadastre)
      @cadastre_address = Candidate::CadastreAddress.where('unit_id = ? AND cadastre_id <> ?', unit, cadastre).last

      if @cadastre_address.present?
           @cadastre_address.dominial_chain + 1
      else
             0
      end
    end


  end
end
