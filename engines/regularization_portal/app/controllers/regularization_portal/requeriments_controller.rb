require_dependency 'regularization_portal/application_controller'

module RegularizationPortal
  class RequerimentsController < ApplicationController
    before_action :address_present!, except: [:address]
    
    def address
    end
    
    def show
    end

    def new
    end

    def create
    end

    private

    def address_present!
      redirect_to action: 'address' if !session[:address_id].present?
    end

    def set_requeriment_params
      params.require(:requeriment).permit(:name)
    end

  end
end
