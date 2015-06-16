module Person
  class UsersController < ApplicationController
    layout 'layouts/material'
    before_action :set_users, only: [:index, :create, :destroy, :update]
    before_action :set_user, only: [:edit, :destroy, :update]
    before_action :set_user_status, only: [:enable, :disable]


    def index
    end

    def new
      @user = User.new
    end


    def create
      @user = User.new(user_params)

      if @user.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation) if params[:password_confirmation].blank?
      end

      if @user.update(user_update_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    def enable
      @user.update(status: true)

    end

    def disable
      @user.update(status: false)

    end

    def destroy
      @user.destroy
      redirect_to user_url, notice: 'User was successfully destroyed.'
    end

    private

    def user_params
      params.require(:user).permit(:name,:cpf,:rg,:rg_org,:born,:blood_type,:curriculum,:password,:password_confirmation ,:end_hour,:start_hour,:wekeend,:attendant,:email,:date_contract,:code,:status,:avatar,:sector_current_id,:sector_origin_id, :jobs_id,:branch_lines_id)
    end

    def user_update_params
      params.require(:user).permit(:name,:cpf,:rg,:rg_org,:born,:blood_type,:curriculum, :end_hour,:start_hour,:wekeend,:attendant,:email,:date_contract,:code,:status,:avatar,:sector_current_id,:sector_origin_id, :jobs_id,:branch_lines_id)
    end

    def set_users
      @users = User.all
    end

    def set_user
      @user = User.find(params[:id])
    end

     def set_user_status
      @user = User.find(params[:user_id])
    end
  end
end
