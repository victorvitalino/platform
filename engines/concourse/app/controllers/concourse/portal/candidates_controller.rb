module Concourse
  class Portal::CandidatesController < ApplicationController
    layout 'layouts/concourse/candidate', except: [:new, :create]

    before_action :authenticate_user!, only: [:index,:edit, :update, :destroy]
    before_action :verification_user!, if: :authenticate_user!, only: [:edit, :update, :destroy]
    before_action :set_candidate, only: [:index, :edit, :destroy, :update]

    def index
    end

    def new
        @candidate = Candidate.new
        @candidate.build_user
        render layout: "layouts/concourse/session"        
    end

    def create
        @candidate = Candidate.new(set_candidate_params)
        if @candidate.save
            redirect_to action: 'index'
        else
            render action: 'new', layout: "layouts/concourse/session"   
        end
    end
    
    def edit
    end

    def update

       params.delete(:cpf)
       params.delete(:password)
       params.delete(:password_confirmation)
       params.delete(:username)

       if @candidate.update(set_candidate_params)
            flash[:success] = t :success
            redirect_to portal_candidates_path
       else
            render action: 'edit'
       end
    end


    private

    def set_candidate_params
        params.require(:candidate).permit(:name, :cpf, :email, :sex, :telphone, :telphone_optional,
                                          :celphone, user_attributes: [:username, :password, :password_confirmation])
    end

    def verification_user!
      redirect_to notify.new_session_path unless current_user.concourse_candidate?
    end

    def set_candidate
        @candidate = Candidate.find(current_user.account_id)
    end

  end
end