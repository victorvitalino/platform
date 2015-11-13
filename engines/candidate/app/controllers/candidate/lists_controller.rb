require_dependency 'candidate/application_controller'
module Candidate
  class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    has_scope :by_income, :using => [:started_at, :ended_at], :type => :hash
      
    def index
      @lists = List.all.order(:created_at)
    end

    def show
      @candidates = apply_scopes("#{@list.view_target}".constantize).select("*, row_number() OVER (ORDER BY total DESC) AS position_x").paginate(:page => params[:page], :per_page => 40)
      @candidates  = @candidates.where("#{@list.condition_sql}") if @list.condition_sql.present?
    end

    def new
      @list = List.new
    end

    def create
      @list = List.new(set_params)

      if @list.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update

      if @list.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end    

    end

    def destroy
      if @list.destroy
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: 'index'
    end


    private

    def set_params
      params.require(:list).permit(:title, :condition_sql, :list_type, :view_target, :publish, :cpf_filter,
                                   :name_filter, :income_filter)
    end

    def set_list
      @list = List.friendly.find(params[:id])
    end

  end
end