require_dependency 'api/application_controller'

module Api
  module Regularization
    class ListsController < ApplicationController

      def index
        @list = ::Candidate::View::GeneralRegularization.joins(:cadastre).where(conv_id:params[:id])
        render json: {data: @list}
      end

    end
  end
end