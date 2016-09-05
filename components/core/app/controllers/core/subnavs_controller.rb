require_dependency "core/application_controller"

module Core
	class SubnavsController < ApplicationController
		before_action :set_nav
		before_action :set_subnavs, only: [:index, :create, :destroy, :update]
		before_action :set_subnav, only: [:edit, :destroy, :update]


		has_scope :status

		def index
		   #authorize :sector,  :index?
		end

		def new
			@subnav = Subnav.new
			#authorize :sector,  :create?
		end

		def create
			@subnav = Subnav.new(subnav_params)
			@subnav.staff_id = current_user.id
			#authorize :sector,  :create?
			@subnav.save
		end

		def edit
		end

		def update
			#authorize :sector,  :update?
			@subnav.update(subnav_params)
		end

		def destroy
			#authorize :sector,  :destroy?
			if @subnav.destroy
				redirect_to action: 'index'
			end
		end

		private

		def subnav_params
			params.require(:subnav).permit(:name,:description,:url,:status,:code,:only_admin,:subnav_id)
		end

		def set_subnavs
			@subnavs = Subnav.all
		end

		def set_nav
			@nav = Nav.find(params[:nav_id])
		end

		def set_subnav
			@subnav = Subnav.find(params[:id])
		end
	end
end
