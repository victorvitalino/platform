require_dependency 'candidate/application_controller'

module Candidate
  class CadastreAddressesController < ApplicationController

   has_scope :cpf
   has_scope :old_process
   has_scope :address

   before_action :set_cadastre_address , only: [:create,:unallocate, :transfer, :deallocate]

    def index
       authorize :cadastre_address,  :index?
       @address = RegularizationPortal::Address.new
       if params[:cpf].present? || params[:old_process].present? || params[:address].present?
        @candidate = Candidate::CadastreAddress.where(situation_id: [0,1])
        @candidate = apply_scopes(@candidate).last
       end
    end


    def new
      @candidate = Candidate::CadastreAddress.where(unit_id: params[:id])
      @cadastre_address = Candidate::CadastreAddress.new
    end

    def create
      @last_status = Candidate::CadastreProcedural.where(cadastre_id:params[:cadastre_address][:cadastre_id]).last
      if @last_status.present?

         @cadastre_address = Candidate::CadastreAddress.new(set_cadastre_address_params)
          @cadastre_address.dominial_chain = Candidate::CadastreAddress.get_dominial_chain(params[:cadastre_address][:unit_id],params[:cadastre_address][:cadastre_id])
          @cadastre_address.type_receipt = 0
          @cadastre_address.situation_id = 1
          @cadastre_address.save

          @candidate = Candidate::Cadastre.find(params[:cadastre_address][:cadastre_id])

          Candidate::CadastreProcedural.create_procedural(@candidate.id,@candidate.id,4,@last_status.convocation_id,@last_status.assessment_id, @old_process,current_user.id,@cadastre_address.observation,@last_status.transfer_process, @last_status.transfer_assessment_id)
          Candidate::CadastreSituation.create_status(@candidate.id,@candidate.id,7)
          Address::Unit.update_situation(params[:cadastre_address][:unit_id],3)

          Candidate::CadastreActivity.create_simple_log!({cadastre_id: @candidate.id,
            staff_id: current_user.id, activity_status_id: 13, type_activity: 2,status: true, type_ocurrency: 1,
            observation: @cadastre_address.observation })

          redirect_to candidate.cadastres_path(cpf: @candidate.cpf)

      end

    end

    def unallocate

       if @candidate.present?
         @address = Candidate::CadastreAddress.where(unit_id: params[:id]).last
         @deallocate = Candidate::Deallocate.new
       else
          flash["danger"] = "O candidato não pode ser desassentado."
          redirect_to cadastre_addresses_path
       end

    end

    def deallocate
        @deallocate = Candidate::Deallocate.new(set_deallocate_params)
        if @deallocate.present?
          @last_status = Candidate::CadastreProcedural.where(cadastre_id: @deallocate.cadastre_id).last
          Candidate::CadastreProcedural.create_procedural(0,@deallocate.cadastre_id,@deallocate.procedural,@last_status.convocation_id,@last_status.assessment_id, @last_status.old_process,current_user.id,@deallocate.observation,@last_status.transfer_process, @last_status.transfer_assessment_id)
          Candidate::CadastreSituation.create_status(0,@deallocate.cadastre_id,@deallocate.status_cadastre)
          @cadastre_address  = Candidate::CadastreAddress.where(unit_id:params[:deallocate][:unit_id],  cadastre_id:@deallocate.cadastre_id).first
          @cadastre_address.update(situation_id: 1)

          Address::Unit.update_situation(params[:deallocate][:unit_id],1)

          Candidate::CadastreActivity.create_simple_log!({cadastre_id: @deallocate.cadastre_id,
            staff_id: current_user.id, activity_status_id: 14, type_activity: 2,status: true, type_ocurrency: 1,
            observation: @deallocate.observation, cadastre_mirror_id: nil })

          redirect_to candidate.cadastres_path(cpf: @last_status.cadastre.cpf)
        end

    end

    def transfer
      @assignee = Candidate::Cadastre.find_by_cpf(params[:cpf])
    end

     private

      def set_deallocate_params
        params.require(:deallocate).permit(:cadastre_id, :unit_id, :observation,:procedural,:status_cadastre)
      end

      def set_cadastre_address_params
        params.require(:cadastre_address).permit(:cadastre_id, :unit_id, :observation,:created_at,:regularization_type_id)
      end

      def set_cadastre_address
         @candidate = Candidate::CadastreAddress.joins("inner join address_registry_units on candidate_cadastre_addresses.unit_id = address_registry_units.unit_id")
                                                .where("address_registry_units.situation = 0 AND candidate_cadastre_addresses.unit_id = ?", params[:id])
      end


  end
end
