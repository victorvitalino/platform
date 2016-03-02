require_dependency 'address/application_controller'
module Address
    class NotaryOfficesController < ApplicationController

        before_action :set_unit
        before_action :set_notary_office, only: [:edit, :update]

        def new
            @notary_office = @unit.notary_offices.new
        end

        def create
            @notary_office = @unit.notary_offices.new(notary_office_params)
            @notary_office.save
        end

        def edit
        end

        def update
            @notary_office.update(notary_office_params)
        end

        private

        def notary_office_params
            params.require(:notary_office).permit(:unit_code, :office, :date_code, :date_contract, :code_contract, :office_contract, :date_petition, :date_signature, :date_anoreg, :date_devolution, :requeriment, :date_requeriment, :declaratory_act_number, :rejection_number, :unit_id, :date_act_declaratory, :date_act_rejection)
        end

        def set_unit
            @unit = Address::Unit.find(params[:unit_id])
        end

        def set_notary_office
            @notary_office = NotaryOffice.find(params[:id])
        end
    end
end
