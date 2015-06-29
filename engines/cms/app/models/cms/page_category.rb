module Cms
  class PageCategory < ActiveRecord::Base
    has_many :page
    validates_presence_of :title, :description
  end
end
