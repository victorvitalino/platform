module Address
    class UnitsController < ApplicationController


        before_action :set_unit, only: [:edit, :destroy, :update, :show]

        def index

        end

        def new
            @unit = Unit.new

        end

        def create
            @unit = Unit.new(unit_params)
            @unit.save
        end

        def edit
        end

        def show
        end

        def update
            @unit.update(unit_params)
        end

        def destroy
            if @unit.destroy
                redirect_to action: 'index'
            end
        end

        private

        def unit_params
            params.require(:unit).permit(:acron_block, :block,:acron_group,:group, :unit, :cep_unit, :area, :complete_address,
                                                                 :burgh, :sefaz, :donate, :date_donate, :date_iptu, :registration_iptu, :certificate, :situation_unit_id,
                                                                 :type_use_unit_id, :city_id, :firm_enterprise_id)
        end



        def set_unit
            @unit = Unit.find(params[:id])
        end
    end
end
