module Authenticate
  module StaffService

    def authenticate_staff?
      redirect_to authenticate.new_staff_path if !session_present? || expired_session?
    end

    def current_user
      Person::Staff.find(session[:staff_id]) rescue nil
    end

    def user_signed_in?
      session_present?
    end

    def user_not_authorized
      flash[:warning] = t(:warning_pundit)
      redirect_to(request.referrer || dashboard.root_path)
    end


    private

    def session_present?
      session[:staff_id].present?
    end

    def expired_session?
      session[:staff_expiration_id] < Time.now
    end



  end
end
