require_dependency 'application_helper'
require_dependency 'portal/application_helper'
module ActionPortal

  class HomeController < ApplicationController
    def index
    end

    def serfm
    end

    def cadastro
    end

    def galeria
      @galerias = Cms::Post.where(publish:true, post_category:'3').order(created_at: :desc)
    end
  end
end
