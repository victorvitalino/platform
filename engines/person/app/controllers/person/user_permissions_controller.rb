module Person
  class UserPermissionsController < ApplicationController
    layout 'layouts/material'
    before_action :set_user_permissions, only: [:index]
    before_action :set_user, only: [:enable, :disable, :index]
    before_action :set_permission, only: [:enable, :disable]
    def index
      authorize @systems
    end

    def enable
      #insert
      @user_permission = UserPermission.new
      authorize @user_permission
      @user_permission.user_id = @user.id
      @user_permission.system_permission_id = @permission.id
      @user_permission.status = true
      @user_permission.save
    end
    def disable
      @user_permission = @user.permissions.where(system_permission_id: @permission.id).last
      authorize @user_permission
      @user_permission.update(status: false)
    end

    private

    def set_user_permissions
      @systems = System.all
    end

    def set_permission
      @permission = SystemPermission.find(params[:user_permission_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
