require_dependency 'candidate/application_controller'
module Candidate
  class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit, :update, :destroy]

    has_scope :by_income, :using => [:started_at, :ended_at], :type => :hash
    has_scope :cpf
    
    def index
      @lists = List.all.order(:created_at)
    end

    def show
      @geral = Rails.cache.fetch("customsql_#{@list.id}", :expires_in => 7.day) do
        "#{@list.view_target}".constantize.where("#{@list.condition_sql}")
      end
    
      @candidates = apply_scopes(@geral).paginate(:page => params[:page], :per_page => 20)
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

    def render_cached_json(cache_key, opts = {}, &block)
      opts[:expires_in] ||= 1.day

      expires_in opts[:expires_in], :public => true
      data = Rails.cache.fetch(cache_key, {raw: true}.merge(opts)) do
        block.call.to_json
      end

      render :json => data
   end

  end
end