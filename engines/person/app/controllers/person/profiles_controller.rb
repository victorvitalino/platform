module Person
	class ProfilesController < ApplicationController
             before_action :set_user, only: [:show]
		def index
		end

		def show
		end

                private

               def set_user
                  @user = User.find(params[:id])
               end
	end


end