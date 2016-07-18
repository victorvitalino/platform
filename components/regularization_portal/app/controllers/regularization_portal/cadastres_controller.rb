require_dependency 'regularization_portal/application_controller'

module RegularizationPortal
  class CadastresController < ApplicationController 
    before_action :set_cors_headers
    
    def show
      @candidate = ::Candidate::Cadastre.regularization.find_by_cpf(params[:id])

      respond_to do |format|
        format.html
        format.json {
          render json: @candidate
        }
      end
    end

    def find_candidate
      @candidate = Find.new
    end

    def show_candidate
      @candidate = Find.new(set_params_find)

      if @candidate.valid?
        redirect_to action: 'show', id: @candidate.cpf
      else
        render action: 'find_candidate'
      end

    end

    private

    def set_params_find
      params.require(:find).permit(:cpf)
    end

    def add_cors_headers
      origin = request.headers["Origin"]
      unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:")
        origin = "http://www.codhab.df.gov.br/"
      end
      headers['Access-Control-Allow-Origin'] = origin
      headers['Access-Control-Allow-Methods'] = 'POST, GET'
      allow_headers = request.headers["Access-Control-Request-Headers"]
      if allow_headers.nil?
        #shouldn't happen, but better be safe
        allow_headers = 'Origin, Authorization, Accept, Content-Type'
      end
      headers['Access-Control-Allow-Headers'] = allow_headers
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Max-Age'] = '1728000'
    end
    
  end
end