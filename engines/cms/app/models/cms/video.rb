module Cms
  class Video < ActiveRecord::Base
    validates_presence_of :title, :url
  end
end
