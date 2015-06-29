module Cms
  class NavCategory < ActiveRecord::Base
    validates_presence_of :name, :description
  end
end
