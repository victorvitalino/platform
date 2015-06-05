module Cms
  class Page < ActiveRecord::Base
    belongs_to :user, class_name: 'User'
  end
end
