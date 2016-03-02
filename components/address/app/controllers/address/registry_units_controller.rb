require_dependency 'address/application_controller'
module Address
    class RegistryUnitsController < ApplicationController

        before_action :set_unit
        before_action :set_registry_unit, only: [:edit, :update]




        def new
            @registry_unit = @unit.registry_unit.new

        end

        def create
            @registry_unit = @unit.registry_unit.new(registry_unit_params)
            @registry_unit.save
        end

        def edit
        end

        def update
            @registry_unit.update(registry_unit_params)
        end

        private

        def unit_params
            params.require(:registry_unit).permit(:unit_code, :office, :date_code, :date_contract, :code_contract, :office_contract, :date_petition, :date_signature, :date_anoreg, :date_devolution, :requeriment, :date_requeriment, :declaratory_act_number, :rejection_number, :unit_id, :date_act_declaratory, :date_act_rejection)
        end

        def set_unit
            @unit = Unit.find(params[:unit_id])
        end

        def set_registry_unit
            @registry_unit = RegistryUnit.find(params[:id])
        end
    end
end
