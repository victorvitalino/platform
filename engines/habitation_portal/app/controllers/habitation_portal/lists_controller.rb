require_dependency 'portal/application_controller'

module HabitationPortal
  class ListsController < ApplicationController 
    before_action :set_list, only: [:show]

    def show
      @geral = Rails.cache.fetch("customsql_#{@list.id}", :expires_in => 7.day) do
        "#{@list.view_target}".constantize.where("#{@list.condition_sql}")
      end
    
      @candidates = apply_scopes(@geral).paginate(:page => params[:page], :per_page => 20)  
    end

    private

    def set_list
      @list = Candidate::List.friendly.find(params[:id])
    end
  end
end