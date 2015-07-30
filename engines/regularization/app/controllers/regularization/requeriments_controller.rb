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

  end
end