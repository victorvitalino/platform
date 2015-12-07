require_dependency 'firm_portal/application_controller'
module FirmPortal
    class SessionsController < ApplicationController
      before_action :validate_session!


      def edit
      end

      def update
        if @firm.update(set_params)
          redirect_to user_companies_path
        else
          render action: 'edit'
        end
      end

      private

      def set_params
        params.require(:user_company).permit(:name, :email, :login_user, :password, :admin)
      end

      def validate_session!
        if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
          @firm = Firm::UserCompany.find(session[:firm_auth_id])
        else
          redirect_to firm_portal.new_authorization_path
        end
      end

    end
  end
