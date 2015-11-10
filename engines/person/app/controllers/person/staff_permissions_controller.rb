require_dependency 'person/application_controller'
module Person
  class StaffPermissionsController < ApplicationController
    before_action :set_staff, only: [:enable, :disable, :index]
    before_action :set_permission, only: [:enable, :disable]

    def index
      @systems = System.all
      @staff_permissions = StaffPermission.all
    end

    def enable
      if @staff.present?
        array = @staff.privilege_id.to_a
        array << @permission
        @staff.update(privilege_id: array)
      end
    end
    
    def disable
      if @staff.present?
        array = @staff.privilege_id.to_a
        array = array.delete(@permission)
        @staff.update(privilege_id: array)
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
