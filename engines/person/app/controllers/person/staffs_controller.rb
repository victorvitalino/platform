require_dependency 'person/application_controller'

module Person
  class StaffsController < ApplicationController
    layout 'layouts/material'
    before_action :set_staffs,       only: [:index, :create, :destroy, :update]
    before_action :set_staff,        only: [:edit, :destroy, :update]
    before_action :set_staff_status, only: [:enable, :disable]

    def index
      authorize @staffs
    end

    def new
      @staff = Staff.new
      @staff.build_user
      authorize @staff
    end


    def create
      @staff = Staff.new(staff_params)
      authorize @staff
      if @staff.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    def edit
    end

    def update
      authorize @staff
      if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation) if params[:password_confirmation].blank?
      end

      if @staff.update(staff_update_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    def enable
      @staff.update(status: true)

    end

    def disable
      @staff.update(status: false)

    end

    def destroy
      @staff.destroy
      redirect_to user_url, notice: 'User was successfully destroyed.'
    end

    private

    def staff_params
      params.require(:staff).permit(:name,:cpf,:rg,:rg_org,:born,:blood_type,:curriculum,:password,:password_confirmation ,
                                    :end_hour,:start_hour,:wekeend,:attendant,:email,:date_contract,:code,:status,:avatar,
                                    :sector_current_id,:sector_origin_id, :job_id,:branch_line_id, user_attributes: [:username, :password, :password_confirmation])
    end

    def staff_update_params
      params.require(:staff).permit(:name,:cpf,:rg,:rg_org,:born,:blood_type,:curriculum, :end_hour,:start_hour,:wekeend,:attendant,:email,:date_contract,:code,:status,:avatar,:sector_current_id,:sector_origin_id, :job_id,:branch_line_id)
    end

    def set_staffs
      @staffs = Staff.includes(:sector_current).unscoped.all.order(:name)
    end

    def set_staff
      @staff = Staff.unscoped.find(params[:id])
    end

    def set_staff_status
      @staff = Staff.find(params[:staff_id])
    end
  end
end
