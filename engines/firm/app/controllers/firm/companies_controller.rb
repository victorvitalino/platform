require_dependency "firm/application_controller"

module Firm
  class CompaniesController < ApplicationController
    layout 'layouts/material'
    before_action :set_companies, only: [:index, :create, :destroy, :update]
    before_action :set_company, only: [:edit, :destroy, :update, :show]


    def index

    end

    def new
      @company = Company.new
      #authorize @company
    end

    def create
      @company = Company.new(company_params)
      #authorize @company
      @company.save
      redirect_to action: 'index'
    end

    def edit
    end

    def show
    end

    def update
      #authorize @company
      @company.update(company_params)
    end

    def destroy
      #authorize @company
      if @company.destroy
        redirect_to action: 'index'
      end
    end

    private

    def company_params
      params.require(:company).permit(:name,:trade,:cnpj, :email,:city_id,:address,:adjuntc_address, :cep, :telephone, :telephone_optional, :status)
    end

    def set_companies
      @companies = Company.all
    end

    def set_company
      @company = Company.find(params[:id])
    end
  end
end
