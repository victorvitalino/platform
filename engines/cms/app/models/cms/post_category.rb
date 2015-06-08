module Cms
  class PostCategory < ActiveRecord::Base
    has_many :page
    validates_presence_of :name
  end
end
