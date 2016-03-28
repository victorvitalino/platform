require_dependency 'profile_user/application_controller'

module ProfileUser 
  class PasswordsController < ApplicationController

    def edit
      @user = ProfileUser::Password.new
    end

    def update
      @user = ProfileUser::Password.new(set_params)
      @user.set_user(current_user)

      if @user.valid?
        @user.update_password
        
        flash[:success] =  t :success
        redirect_to action: :edit
      else
        render action: :edit
      end
    end
      
    private

    def set_params
      params.require(:password).permit(:password, :password_confirmation, :current_password)
    end
  end
end