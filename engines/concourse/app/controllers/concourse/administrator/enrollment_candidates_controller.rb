module Concourse
  class Administrator::EnrollmentCandidatesController < ApplicationController
    
    def show
      @enrollment_candidate = EnrollmentCandidate.find(params[:id])
      @candidate = @enrollment_candidate.candidate
    end

  end
end