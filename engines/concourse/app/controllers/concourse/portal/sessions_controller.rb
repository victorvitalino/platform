module Concourse
  class Portal::SessionsController < ApplicationController
    layout 'layouts/concourse/session'

    def index
    end

    def new
      @session = Candidate.new
    end

    def create
      @candidate = Candidate.authenticate(params[:cpf], params[:password])

      if @candidate
        session[:candidate_id] = candidate.id
        redirect_to portal_candidates_path
      else
        render action: 'new'
      end
    end

  end
end