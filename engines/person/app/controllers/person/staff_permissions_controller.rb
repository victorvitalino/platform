module Person
  class StaffPermissionsController < ApplicationController
    layout 'layouts/material'
    before_action :set_staff_permissions, only: [:index]
    before_action :set_staff, only: [:enable, :disable, :index]
    before_action :set_permission, only: [:enable, :disable]
    def index
      authorize @staff_permissions
    end

    def enable
      #insert
      @staff_permission = StaffPermission.new
      authorize @staff_permission
      @staff_permission.staff_id = @staff.id
      @staff_permission.system_permission_id = @permission.id
      @staff_permission.system_id = @permission.system_id
      @staff_permission.status = true
      @staff_permission.save
    end
    def disable
      @staff_permission = @staff.permissions.where(system_permission_id: @permission.id).last
      authorize @staff_permission
      @staff_permission.update(status: false)
    end

    private

    def set_staff_permissions
      @systems = System.all
      @staff_permissions = StaffPermission.all
    end

    def set_permission
      @permission = SystemPermission.find(params[:staff_permission_id])
    end

    def set_staff
      @staff = Staff.find(params[:staff_id])
    end
  end
end
