require_dependency 'regularization/application_controller'

module Regularization
  class RequerimentsController < ApplicationController
    
    def index
      @requeriments = Requeriment.all.order('created_at DESC')
    end

    def show
      @requeriment = Requeriment.find(params[:id])
    end
  end
end