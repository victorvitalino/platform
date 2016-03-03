require_dependency 'address/application_controller'
module Address
    class UnitsController < ApplicationController


        before_action :set_unit, only: [:edit, :destroy, :update, :show]

        has_scope :situation_unit
        has_scope :city
        has_scope :cpf
        has_scope :block
        has_scope :group_address
        has_scope :unit

        def index
            @unit = Unit.new
            @units = Address::Unit.all
            @units = apply_scopes(@units).paginate(:page => params[:page], :per_page => 20)
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
