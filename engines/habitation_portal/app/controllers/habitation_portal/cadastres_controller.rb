require_dependency 'habitation_portal/application_controller'
module HabitationPortal
  class CadastresController < ApplicationController 
    before_action :cadastre_session!

    def show
    end

    private

    def cadastre_session!
      if session[:habitation_cadastre_id].present?
      else
        redirect_to new_authenticate_path
      end
    end
  end
end