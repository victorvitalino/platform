require_dependency "person/application_controller"

module Sefaz
	class ExemptionsController < ApplicationController

    def new
      @exemption = Exemption.new
    end

    def create
      Exemption.import(set_params_exemption)
    end

    private

    def set_params_exemption
      params.require(:exemption).permit(:file)
    end


  end
end
