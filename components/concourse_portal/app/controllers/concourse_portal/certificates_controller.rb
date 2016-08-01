require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  class CertificatesController < ApplicationController
    layout 'shared/portal'

    def new
      @certificate = ConcoursePortal::Certificate.new 
    end

    def create
      @certificate = ConcoursePortal::Certificate.new(set_params)

      if !@certificate.valid?
        render action: :new
      else
        @candidate = Concourse::Candidate.find(@certificate.candidate)
        render layout: 'layouts/patternfly/less-bootstrap'
      end
    end

    def show
    end

    private

    def set_params
      params.require(:certificate).permit(:candidate, :cpf)
    end

  end
end