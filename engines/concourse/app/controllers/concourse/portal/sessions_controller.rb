module Concourse
  class Portal::SessionsController < ApplicationController
    layout 'layouts/concourse/session'
    before_action :candidate_session, only: [:new, :create]

    def index
    end

    def new
      @session = Session.new
    end

    def create
      @session = Session.new(set_params)

      if @session.valid?
        session[:candidate_id] =  @session.candidate
        redirect_to portal_candidates_path
      else
        render action: 'new'
      end
    end

    def destroy
      if session.delete(:candidate_id)
        @candidate = nil
         redirect_to portal.root_path
      end
    end

    private

    def set_params
      params.require(:session).permit(:cpf, :password)
    end

    def candidate_session
      redirect_to portal_candidates_path if session[:candidate_id].present?
    end

  end
end