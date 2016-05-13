require_dependency 'candidate/application_controller'

module Candidate
  class VerificationsController < ApplicationController
    before_action :set_verification, only: [:edit, :update, :destroy]
    before_action :set_verifications

    def index
    end

    def new
      @verification = Candidate::Verification.new
    end

    def create
      @verification = Candidate::Verification.new(set_params)
      @verification.save
    end

    def edit
    end

    def update
      @verification.update(set_params)
    end

    def destroy
      @verification.destroy
    end

    private


    def set_params
      params.require(:verification).permit(:name, :description, :text_valid, :text_invalid, :code, :verification_type, :sql, :service, :program_id, :publish)
    end

    def set_verification
      @verification = Candidate::Verification.find(params[:id])
    end

    def set_verifications
      @verifications = Candidate::Verification.all
    end

  end
end