module Regularization
  class RequerimentsController < ApplicationController
    layout 'layouts/portal/application'
    before_action :set_address
    before_action :validate_cpf_session, only: [:show, :bank_slip]

    def index
    end

    def new
      @requeriment = Requeriment.new
    end

    def create
      @requeriment = Requeriment.new(set_params)
      @requeriment.unit_id = session[:address_id]
      if @requeriment.save
        session[:cpf] = @requeriment.cpf
        flash[:success] = t :success
        redirect_to @requeriment
      else
        render action: 'new'
      end
    end

    def bank_slip
      @requeriment = Requeriment.applicant(session[:cpf]).find(params[:requeriment_id])

      @convenant = Finance::Convenant.new({
        code: 'requerimento',
        deadline: Time.now + 10.days,
        cpf: @requeriment.cpf,
        name: @requeriment.name,
        observation: "requerimento para regularização - #{@requeriment.unit.complete_address}"
      })

      render layout: 'layouts/finance/show_payment' 

    end

    def show
      @requeriment = Requeriment.applicant(session[:cpf]).find(params[:id])
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

    def validate_cpf_session
      redirect_to new_address_path unless session[:cpf].present?
    end

  end
end