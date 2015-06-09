module Cms
  class PostCategory < ActiveRecord::Base
    has_many :post
    validates_presence_of :name
  end
end
