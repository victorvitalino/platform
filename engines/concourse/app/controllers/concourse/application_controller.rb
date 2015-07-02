module Concourse
  class ApplicationController < ActionController::Base
    helper Portal::ApplicationHelper

    before_filter :set_url

    def connect(page)
      Net::HTTP.get_response(URI.parse(page)).body
    end

    def parse(body)
      begin
        JSON.parse(body)
      rescue JSON::ParserError => e
        false
      end
    end


    private

    def set_url
      @url = "http://concursos.localhost.df.gov.br:3000"
    end


    
  end
end
