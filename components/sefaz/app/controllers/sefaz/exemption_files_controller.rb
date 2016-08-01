require_dependency "sefaz/application_controller"

module Sefaz
	class ExemptionFilesController < ApplicationController
		before_action :set_cadastres_alloment

    def new
			authorize :exemption,  :create?
      @exemption_file = Sefaz::ExemptionFile.new
    end

    def create
			authorize :exemption,  :create?
			
			@exemption_file = Sefaz::ExemptionFile.new(set_params)
			@exemption_file.user_id 		 = current_user.id
			@exemption_file.allotment_id = @allotment.id
			@exemption_file.import_files!
			@allotment.update(send_status_id: 2)
    end

    private

    def set_params
      params.require(:exemption_file).permit(:file_path)
    end

		def set_cadastres_alloment
			@allotment  = Sefaz::Allotment.find(params[:allotment_id]) rescue nil
			@exemptions = @allotment.exemptions
		end
  end
end
