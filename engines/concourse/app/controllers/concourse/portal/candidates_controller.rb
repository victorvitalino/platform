module Concourse
  class Portal::CandidatesController < ApplicationController
    layout 'layouts/concourse/candidate', except: [:new, :create]

    def index
    end

    def new
        @candidate = Candidate.new
        render layout: "layouts/concourse/session"        
    end

    def create
        @candidate = Candidate.new

        if @candidate.save
            rendirect_to action: 'index'
        else
            render action: 'new'
        end
    end
    
    def edit
    end

    def update
    end

  end
end