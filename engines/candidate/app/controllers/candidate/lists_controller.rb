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
      params[:income] ||= 'faixa1'

      case params[:income]
      when 'faixa1'
        @geral = Rails.cache.fetch("faixa1", :expires_in => 7.day) do
          "#{@list.view_target}".constantize.where("#{@list.condition_sql}").where("income BETWEEN 0 AND 1600")
        end
      when 'faixa2'
        @geral = Rails.cache.fetch("faixa2", :expires_in => 7.day) do
          "#{@list.view_target}".constantize.where("#{@list.condition_sql}").where("income BETWEEN 1601 AND 3000")
        end
      when 'faixa3'
        @geral = Rails.cache.fetch("faixa3", :expires_in => 7.day) do
          "#{@list.view_target}".constantize.where("#{@list.condition_sql}").where("income BETWEEN 3001 AND 5000")
        end
      when 'faixa4'
        @geral = Rails.cache.fetch("faixa4", :expires_in => 7.day) do
          "#{@list.view_target}".constantize.where("#{@list.condition_sql}").where("income > 5001")
        end
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