require_dependency "person/application_controller"

module Sefaz
	class ExemptionsController < ApplicationController

    def new
      @exemption = Exemption.new

    end

    def create
      Exemption.import(params[:file])
			redirect_to root_url, notice: "Products imported."
    end

  end
end
