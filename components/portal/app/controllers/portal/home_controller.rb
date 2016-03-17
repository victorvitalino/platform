require_dependency 'portal/application_controller'
module Portal
  class HomeController < ApplicationController
    def index
    end
    def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      @post = Cms::Post.where("title like ?", "%#{query}%")
    end
  end
end
