module Candidate
  class OccurrenceSituationsController < ApplicationController
    before_action :set_situation, only: [:edit, :update]

    def index
      @situations = Candidate::OccurrenceSituation.all.order(:id)
    end

    def new
      @situation = Candidate::OccurrenceSituation.new
    end

    def create 
      @situation = Candidate::OccurrenceSituation.new(set_params)
      if @situation.save
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @situation.update(set_params)
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @situation.destroy
        flash[:success] = t :success
      else 
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_situation
      @situation = Candidate::OccurrenceSituation.find(params[:id])
    end

    def set_params
      params.require(:occurrence_situation).permit(:name, :description, :color, :status, :visible_portal, :label_portal)
    end

  end
end