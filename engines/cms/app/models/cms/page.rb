module Cms
  class Page < ActiveRecord::Base
    belongs_to :page_category
  end
end
