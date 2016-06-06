module Firm
  class UserCompany < ActiveRecord::Base
    belongs_to :company

    validates_presence_of :login_user, :password
    validates :password,  confirmation: true,length: {within: 6..40}

  end
end
