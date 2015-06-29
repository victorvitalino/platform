module Concourse
  class Portal::EnrollmentCandidatesController < ApplicationController
    layout 'layouts/concourse/project'
    before_action :authenticate_user!
    before_action :set_project, except: [:show]
    before_action :set_enrollment, except: [:show]
    def new
      @candidate = @enrollment.enrollment_candidates.new
    end

    def create
      @candidate = @enrollment.enrollment_candidates.new(set_params_enrollment)
      @candidate.candidate_id = current_user.account_id
      @candidate.project_id = @project.id
      
      @candidate.attributes_values.each_with_index do |attr, i|
         if attr[1].class != String
          uploader = Concourse::ImageUploader.new 
          if uploader.store!(attr[1])
           @candidate.attributes_values[attr[0]] = uploader.url
          end
         end
      end
      @candidate.properties = @candidate.attributes_values.to_hash
      
      if @candidate.save
        redirect_to portal_candidates_path
      else
        render action: 'new'
      end
    end

    def edit
      @candidate = @enrollment.enrollment_candidates.find(params[:id])
    end

    def update
      @candidate = @enrollment.enrollment_candidates.find(params[:id])
    
      if @candidate.update(set_params_enrollment)
        flash[:success] = t :success
        redirect_to action: 'show'
      else
        render action: 'edit'
      end
    end

    def show
      @enrollment_candidate = EnrollmentCandidate.where(candidate_id: current_user.account_id, enrollment_id: params[:enrollment_id]).last
      @candidate = Candidate.find(current_user.account_id)
      render layout: "layouts/concourse/candidate"

    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_enrollment
      @enrollment = @project.enrollments.find(params[:enrollment_id])
    end

    def set_params_enrollment
      params.require(:enrollment_candidate).permit(:properties, :attributes_values).tap do |whitelisted|
        whitelisted[:attributes_values] = params[:enrollment_candidate][:attributes_values]
      end
    end


  end
end