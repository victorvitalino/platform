module Cms
  class Post < ActiveRecord::Base
    belongs_to :post_category
    validates_presence_of :title, :content, :post_category
  end
end
