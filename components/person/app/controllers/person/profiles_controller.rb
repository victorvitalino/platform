require_dependency 'person/application_controller'

module Person
	class ProfilesController < ApplicationController
    before_action :set_user, only: [:show]

		def index
		end

		def show
		end

    private

    def set_user
       @user = Staff.find(params[:id])
    end
  end
end