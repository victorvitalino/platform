module Concourse
  class Portal::CandidatesController < ApplicationController
    layout 'layouts/concourse/candidate', except: [:new, :create]

    before_action :set_candidate_session, only: [:edit, :update, :index]
    before_action :set_candidate, only: [:edit, :update]

    def index
    end

    def new
        @candidate = Candidate.new
        render layout: "layouts/concourse/session"        
    end

    def create
        @candidate = Candidate.new(set_candidate_params)
        if @candidate.save
            session[:candidate_id] = @candidate.id
        end
    end
    
    def edit
    end

    def update
       if params[:password].blank?
            params.delete(:password)
            params.delete(:password_confirmation) if params[:password_confirmation].blank?
       end
       
       if @candidate.update(set_candidate_update_params)
            flash[:success] = t :success
            redirect_to portal_candidates_path
       else
            render action: 'edit'
       end
    end


    private

    def set_candidate_params
        params.require(:candidate).permit(:name, :cpf, :email, :telphone, :telphone_optional,
                                          :celphone, :password, :password_confirmation)
    end

    def set_candidate_update_params
        params.require(:candidate).permit(:name, :email, :telphone, :telphone_optional,
                                         :celphone, :password, :password_confirmation)
 
    end

    def set_candidate
        @candidate = Candidate.find(session[:candidate_id])
    end

    def set_candidate_session
        if session[:candidate_id].present?  
            @candidate = Candidate.find(session[:candidate_id])
        else
            redirect_to new_portal_session_path
        end
    end

  end
end