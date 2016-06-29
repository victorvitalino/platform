require_dependency 'application_helper'
require_dependency 'portal/application_helper'
module ActionPortal

  class HomeController < ApplicationController
    def index
      @events_i = Action::SocialEvent.where(situation:'2',status:true).limit(3).order(date: 'ASC')
      @events_c = Action::SocialEvent.where(situation:'0',status: true).limit(3).order(date: 'DESC')
    end

    def cadastro
    end

    def galeria
      @galerias = Cms::Post.where(post_category:'10').order(created_at: :desc)
    end
  end
end
