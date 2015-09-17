require_dependency 'candidate/application_controller'

module Candidate
  class ConvocationsController < ApplicationController
    before_action :set_convocation, only: [:edit, :update, :destroy]

    def index
      @convocations = Convocation.all
    end

    def new
      @convocation = Convocation.new
    end

    def create
      @convocation = Convocation.new(set_params)
      if @convocation.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @convocation.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end


    def destroy
      if @convocation.destroy
        redirect_to action: 'index'
      end
    end

    private

    def set_convocation
      @convocation = Convocation.find(params[:id])
    end

    def set_params
      params.require(:convocation).permit(:description, :criterion, :start, :end, :quantity, :convocation_type, :status)
    end
  end
end