require_dependency 'person/application_helper'
module Dashboard
  class ApplicationController < ActionController::Base
  	layout 'layouts/material'
		helper ::ApplicationHelper
	
  	include Pundit
    

    before_action :redirect_first_access
  
    private
    def redirect_first_access
      if current_user.sign_in_count == 1 && !devise_controller?
        flash[:info] = "Você precisa alterar sua senha para seguir com o acesso normalmente."
        redirect_to main_app.edit_user_registration_path 
      end
    end
  end
end
