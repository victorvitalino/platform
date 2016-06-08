require_dependency 'application_helper'
require_dependency 'portal/application_helper'
module ActionPortal

  class HomeController < ApplicationController
    def index
    end

    def serfm
    end

    def SERFM_SOL
    end

    def cadastro
    end

    def galeria
      @galerias = Cms::Post.where(post_category:'10').order(created_at: :desc)
    end
  end
end
