module Regularization
  class RequerimentsController < ApplicationController
    layout 'layouts/portal/application'
    before_action :set_address

    def index
    end

    def new
      @requeriment = Requeriment.new
    end

    def create
      @requeriment = Requeriment.new(set_params)
      if @requeriment.save
        flash[:success] = t :success
        redirect_to @requeriment
      else
        render action: 'new'
      end
    end

    def bank_slip
    end

    def show
      @requeriment = Requeriment.find(params[:id])
    end

    private

    def set_address
      if session[:address_id].present?
        @address = ::Address::Unit.find(session[:address_id])
      else
        flash[:info] = t :info 
        redirect_to regularization.new_address_path
      end
    end


    def set_params
      params.require(:requeriment).permit(:name, :cpf, :rg, :email, :nacionality, :martial_status,
                                          :gender, :born, :telephone, :celphone, :complete_address,
                                          :income, :income, :spouse_name, :spouse_cpf, :owner, 
                                          :marital_status, :nationality)
    end

  end
end