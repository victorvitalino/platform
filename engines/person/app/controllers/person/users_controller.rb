

module Person
	class UsersController < ApplicationController
		layout 'layouts/material'
		before_action :set_users, only: [:index, :create, :destroy, :update]
		before_action :set_user, only: [:edit, :destroy, :update]



		def index
		end

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)

      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
		end

		def edit
		end

		def update
			if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
		end

		def destroy
			@user.destroy
      redirect_to user_url, notice: 'User was successfully destroyed.'
		end

		private

		def user_params
			params.require(:user).permit(:name,:cpf,:rg,:rg_org,:born,:blood_type,:curriculum,:encrypted_password, :end_hour,:start_hour,:wekeend,:attendant,:email,:date_contract,:code,:status)
		end

		def set_users
			@users = User.all
			@sectors = Sector.all
		end

		def set_user
			@user = User.find(params[:id])
		end
	end
end
