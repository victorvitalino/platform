module Cms
  class PostCategory < ActiveRecord::Base
    has_many :post

    audited

    
    validates_presence_of :title
  end
end
