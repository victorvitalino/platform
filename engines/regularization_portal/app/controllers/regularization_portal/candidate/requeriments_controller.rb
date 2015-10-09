require_dependency 'regularization_portal/application_controller'

module RegularizationPortal
  module Candidate
    class RequerimentsController < ApplicationController
      before_action :validate_candidate!, except: [:verification, :validate_verification]
      before_action :set_requeriments, only: [:index, :show]

      def verification
        session[:candidate_cpf] = nil
        @requeriment = RequerimentVerification.new
      end

      def validate_verification
        @requeriment = RequerimentVerification.new(set_requeriment_params)

        if @requeriment.valid?
          session[:candidate_cpf] = @requeriment.first.cpf
          flash[:success] = t :success
          redirect_to action: 'index'
        else
          flash[:danger] = t :danger
          render action: 'verification'
        end
      end

      def index
      end

      def show
        @requeriment = @requeriments.find(params[:id])
      end
      
      private

      def set_requeriments
        @requeriments = Regularization::Requeriment.where(cpf: session[:candidate_cpf])
      end

      def validate_candidate!
        if !session[:candidate_cpf].present?
          redirect_to verification_candidate_requeriments_path
        end
      end

      def set_requeriment_params
        params.require(:requeriment_verification).permit(:cpf, :born)
      end
    end
  end
end