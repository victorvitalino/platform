module Concourse
  class ConsultsController < ApplicationController
    
    def read
      if params[:consult_id].present? && params[:project_id].present?
        @consult = Consult.find(params[:consult_id])
        @project = Project.friendly.find(params[:project_id])
        if @consult.update(status: true)
          flash[:success] = t :success
          redirect_to project_path(id: @project, q: 'consultas')
        else

        end
      end
    end



  end
end