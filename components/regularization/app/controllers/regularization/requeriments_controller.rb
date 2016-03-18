require_dependency 'regularization/application_controller'

module Regularization
  class RequerimentsController < ApplicationController

    has_scope :name_candidate
    has_scope :cpf

    def index
      authorize :requeriment, :index?
      @requeriments = Requeriment.all.order('created_at DESC')
      @requeriments =  apply_scopes(@requeriments).paginate(:page => params[:page], :per_page => 40)
    end

    def show
      authorize :requeriment, :index?
      @requeriment = Requeriment.find(params[:id])
    end
  end
end