module Cms
  class Post < ActiveRecord::Base
    belongs_to :post_category
  end
end
