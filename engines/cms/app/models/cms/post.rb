module Cms
  class Post < ActiveRecord::Base
    belongs_to :post_category
    validates_presence_of :title, :content
  end
end
