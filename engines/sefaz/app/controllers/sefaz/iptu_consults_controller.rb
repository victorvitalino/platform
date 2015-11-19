require_dependency 'sefaz/application_controller'
module Sefaz
  class IptuConsultsController < ApplicationController
    
    def new
     @iptu = Sefaz::Iptu.new
    end

    def create
      @iptu = Sefaz::Iptu.new(set_params)
      if @iptu.valid?
        @iptu.search!
        render action: 'new'
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:iptu).permit(:cpf)
    end

  end
end