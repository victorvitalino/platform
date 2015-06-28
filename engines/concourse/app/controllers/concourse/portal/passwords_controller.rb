module Concourse
  class Portal::PasswordsController < ApplicationController
    layout 'layouts/concourse/candidate'

    def edit
      @candidate = Candidate.find(current_user.account_id)
      @candidate.build_user
    end

    def create
      @password = Password.new(set_params)
      @password.set_candidate(session[:candidate_id])

      if @password.valid?
        @password.update_candidate
        
        flash[:success] = t :success
        redirect_to portal_candidates_path
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:password).permit(:old_password, :new_password, :confirmation_password)
    end

 end
end