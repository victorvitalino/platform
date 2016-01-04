require_dependency 'maintenance/application_controller'

module Maintenance
  class ScriptsController < ApplicationController
    def index
    end

    def run
      if params[:command].present?
        case params[:command]
        when 'restart'
          begin 
            exec('mina nginx:restart')
            flash[:success] = 'comando executado com sucesso!'
          rescue Exception => e
            flash[:danger] = e
            redirect_to action: :index
          end
        when 'deploy'
          begin 
            exec('sh deploy.sh')
            flash[:success] = 'comando executado com sucesso!'
          rescue Exception => e
            flash[:danger] = e
            redirect_to action: :index
          end
        end
      else
        redirect_to action: :index
      end
    end
  end
end