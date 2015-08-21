module ConcoursePortal
  class SubscribesController < ApplicationController
    before_action :set_project 

    def index
      @subscribe  = ConcoursePortal::Subscribe.new
    end

    def create
      @subscribe = ConcoursePortal::Subscribe.new(set_params)
      
      if @subscribe.valid?
      else
        render action: 'index'
      end
    end


    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

    def set_params
      params.require(:subscribe).permit(:subscribe, :password)
    end

  end
end