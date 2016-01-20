require_dependency 'concourse_portal/application_controller'
module ConcoursePortal
  class SubscribesController < ApplicationController
   
    def index
      @subscribe  = ConcoursePortal::Subscribe.new
      @current_nav = 'new_subscribe'
    
    end

    def create
      
      @subscribe = ConcoursePortal::Subscribe.new(set_params)
      @current_nav = 'new_subscribe'
      
      if @subscribe.valid?
        session[:candidate_id] = @subscribe._id
        @candidate = Concourse::Candidate.find(session[:candidate_id])
        
        redirect_to project_subscribes_success_path(@candidate.subscribe.project.slug)

      else
        render action: 'index'
      end
    end

    def remember_subscribe
      @subscribes = Concourse::Candidate.where(cpf: params[:cpf], subscribe_id: [@project.subscribes.map(&:id)])
    end

    def remember_password
      @candidate = Concourse::Candidate.find(params[:subscribe_id]) rescue nil

      if @candidate.present?
          token = Concourse::CandidateToken.new(candidate_id: @candidate.id)
          token.save

          ConcoursePortal::SubscribeMailer::remember_password(@candidate.email, @candidate, @project, token.secret_key).deliver_now!
          render action: 'remember_password_success'
      else
        redirect_to action: 'remember_subscribe'
      end
    end

    def remember_password_success
    end


    def edit_password
      @token = Concourse::CandidateToken.where(secret_key: params[:token], status: false).last

      if @token.present?
        @candidate = Concourse::Candidate.find(@token.candidate_id)
        session[:token_id] = @token.id
      else
        redirect_to action: 'remember_subscribe'
      end
    end

    def update_password
      @token = Concourse::CandidateToken.find(session[:token_id]) rescue nil
      
      @candidate = Concourse::Candidate.find(@token.candidate_id)
      @candidate.password = params[:candidate][:password]
      @candidate.confirmation_password = params[:candidate][:confirmation_password]
      @candidate.token = @token.secret_key

      if @candidate.save
        @token.update(status: true)
        session[:token_id] = nil

        flash[:success] = 'Senha atualizada com sucesso'
        redirect_to action: 'index'
      else
        render action: 'edit_password', token: @token.secret_key
      end
    end

    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

    def set_params
      params.require(:subscribe).permit(:subscribe, :password)
    end

  end
end