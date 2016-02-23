require_dependency 'profile_user/application_controller'

module ProfileUser
  class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]

    def edit
    end

    def update
      if @user.update(set_params)
        flash[:success] =  t :success
        redirect_to action: :edit
      else
        render action: :edit
      end
    end
      
    private

    def set_user
      @user = Person::Staff.find(current_user)
    end

    def set_params
      params.require(:staff).permit(:avatar, :personal_image, :curriculum,
                                    :name, :email, :born, :branch_line)
    end
  end
end