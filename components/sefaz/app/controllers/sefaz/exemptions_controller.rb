require_dependency "person/application_controller"

module Sefaz
	class ExemptionsController < ApplicationController

		def index
			@exemption = Exemption.all
		end

    def new
      @exemption = Exemption.new

    end

    def create
			begin
				Sefaz::Exemption.import(params[:file])
				redirect_to exemptions_path, notice: "Products imported."
			rescue
				redirect_to exemptions_path, notice: "Invalid CSV file format."
			end

    end

  end
end
