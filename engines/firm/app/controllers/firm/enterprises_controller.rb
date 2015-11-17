require_dependency "firm/application_controller"

module Firm
  class EnterprisesController < ApplicationController
    layout 'layouts/material'
    before_action :set_enterprises, only: [:index, :create, :destroy, :update]
    before_action :set_enterprise, only: [:edit, :destroy, :update, :show]


    def index

    end

    def new
      @enterprise = Enterprise.new
      #authorize @company
    end

    def create
      @enterprise = Enterprise.new(enterprise_params)
      #authorize @company
      @enterprise.save
      redirect_to action: 'index'
    end

    def edit
    end

    def show
    end

    def update
      #authorize @company
      @enterprise.update(enterprise_params)
      redirect_to action: 'index'
    end

    def destroy
      #authorize @company
      if @enterprise.destroy
        redirect_to action: 'index'
      end
    end

    private

    def enterprise_params
      params.require(:enterprise).permit(:name,:value,:tipology_id, :company_id,:city_id,:status)
    end

    def set_enterprises
      @enterprises = Enterprise.all
    end

    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end
  end
end
