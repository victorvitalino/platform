class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_password

  include Pundit

  def user_not_authorized(exception)
    redirect_to('/404')
  end

  private

  def set_password
    if current_user.present?
      if current_user.account.password_change.nil?  
        flash[:danger] = "Você precisar trocar sua senha para prosseguir com o acesso."
        redirect_to main_app.edit_user_registration_path unless devise_controller?
      end
    end
  end

end
