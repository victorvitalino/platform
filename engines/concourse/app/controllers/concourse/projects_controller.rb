module Concourse
  class ProjectsController < ApplicationController
    

    def index
      @projects = parse(connect("#{@url}/projects"))
      
      if @projects
        render layout: 'layouts/concourse/project' 
      else
        redirect_to '/404'
      end
    end

    def show
      @project = parse(connect("#{@url}/project/#{params[:id]}"))
      redirect_to '/404' if !@project
    end

    def enrollment
      redirect_to "http://concursos.localhost.df.gov.br/" if ENV['RAILS_ENV'] == 'development'
      redirect_to "http://concursos.codhab.df.gov.br/candidato/sign_up" if ENV['RAILS_ENV'] == 'production'
    end

    def candidate_access
      redirect_to "http://concursos.localhost.df.gov.br/" if ENV['RAILS_ENV'] == 'development'
      redirect_to "http://concursos.codhab.df.gov.br/candidato/sign_up" if ENV['RAILS_ENV'] == 'production'
    end
   
  end
end