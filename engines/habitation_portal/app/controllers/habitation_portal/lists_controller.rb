require_dependency 'habitation_portal/application_controller'

module HabitationPortal
  class ListsController < ApplicationController 
    before_action :set_list, only: [:show]

    has_scope :cpf

    def show
      @geral = "#{@list.view_target}".constantize.where("#{@list.condition_sql}")     
      @candidates = apply_scopes(@geral).paginate(:page => params[:page], :per_page => 20)  
    end

    private

    def set_list
      begin
        @list = Candidate::List.portal.friendly.find(params[:id]) 
      rescue 
        redirect_to '/404'
      end
    end
  end
end