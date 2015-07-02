module Concourse
  class PagesController < ApplicationController
    before_action :set_project

    def index
    end

    def show
      @page = parse(connect("#{@url}/page/#{params[:id]}"))

      if @page
        render layout: 'layouts/concourse/application' 
      else
        redirect_to '/404'
      end
    end


    private
   
    def set_project
      @project = parse(connect("#{@url}/project/#{params[:project_id]}"))
    end 

  end
end