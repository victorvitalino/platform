module AuthenticateSupport

  def login_staff_admin
    before(:each) do
      user = FactoryGirl.create :person_staff, :login_staff_admin
      request.session[:staff_id] = user.id
    end
  end 

end
