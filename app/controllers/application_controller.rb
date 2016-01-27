class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_password

  include Pundit

  def user_not_authorized(exception)
    redirect_to('/404')
  end

  private

  def set_password

  end

end
