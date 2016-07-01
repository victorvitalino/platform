require_dependency 'portal/application_controller'
module Portal
  class HabitaController < ApplicationController

    def index
      # unless Date.today > Date.parse('24/06/2016') || params[:quero_ver].present?
      #   render json: "Não disponível"
      # end
    end

  end
end
