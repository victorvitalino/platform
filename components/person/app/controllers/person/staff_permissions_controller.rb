require_dependency 'person/application_controller'
module Person
  class StaffPermissionsController < ApplicationController
    before_action :set_staff, only: [:add, :remove, :index, :show]
    before_action :set_permission, only: [:add, :remove]

    def index
      @system = System.find(params[:staff_system_id])
      @permissions = @system.system_permissions
    end

    def add
      @system = System.find(params[:staff_system_id])
      @permission = SystemPermission.find(params[:staff_permission_id])
      @staff.permissions.new({
        system_permission_id: @permission.id,
        system_module_id: @system.system_module_id,
        system_id: @system.id,
      })

      if @staff.save
        flash[:success] = t :success
        redirect_to action: :index, staff_system_id: @system.id, staff_id: @staff.id
      else
        flash[:danger] =  t :danger
        redirect_to action: :index, staff_system_id: @system.id, staff_id: @staff.id
      end
    end

    def remove
      @system = System.find(params[:staff_system_id])
      @permission = SystemPermission.find(params[:staff_permission_id])
      @staff_permission = @staff.permissions.find_by_system_permission_id(@permission)

      if @staff_permission.destroy
        flash[:success] = t :success
        redirect_to action: :index, staff_system_id: @system.id, staff_id: @staff.id
      else
        flash[:danger] =  t :danger
        redirect_to action: :index, staff_system_id: @system.id, staff_id: @staff.id
      end
    end

    private

    def set_staff
      @staff = Staff.find(params[:staff_id]) rescue nil
    end

    def set_permission
      @permission = params[:staff_permission_id]
    end

  end
end
