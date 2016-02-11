require_dependency 'authenticate/application_controller'

module Authenticate
  class StaffsController < ApplicationController
    layout 'authenticate/staff_session'

    def new
      @staff = Authenticate::Staff.new
    end

    def create
      @staff = Authenticate::Staff.new(set_params)

      if @staff.valid?
        create_session(@staff)
        redirect_to dashboard.root_path
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:staff).permit(:code, :password)
    end

    def create_session(staff)
      session[:staff_id] = staff.id
      session[:staff_expiration_id] = Time.now + 4.hours
      
      Person::Staff.find(staff.id).update(last_signed_in_at: Time.now)
    end
  end
end