require_dependency 'habitation_portal/application_controller'
module HabitationPortal
  class AuthenticateController < ApplicationController 

    def new
      @authenticate = Authenticate.new
    end

    def create
      @authenticate = Authenticate.new(set_params)

      if @authenticate.valid?
        session[:habitation_cadastre_id] = @authenticate.id
        redirect_to cadastre_path
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:authenticate).permit(:cpf, :password)
    end
  end
end