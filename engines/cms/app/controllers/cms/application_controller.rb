require_dependency 'application_controller'

module Cms
  class ApplicationController < ActionController::Base
    layout 'layouts/material'

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    helper ::ApplicationHelper
<<<<<<< HEAD

  #  before_action :redirect_first_access

=======
  
  
>>>>>>> 0f9fe68dabaf153cfb952e93fc2a8cf71db853f2
    private

    def user_not_authorized(exception)
      redirect_to('/404')
    end
<<<<<<< HEAD

    def redirect_first_access
      if current_user.sign_in_count == 1 && !devise_controller?
        flash[:info] = "Você precisa alterar sua senha para seguir com o acesso normalmente."
        redirect_to main_app.edit_user_registration_path
      end
    end
  end
=======
 end
>>>>>>> 0f9fe68dabaf153cfb952e93fc2a8cf71db853f2
end
