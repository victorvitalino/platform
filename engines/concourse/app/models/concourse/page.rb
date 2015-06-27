module Concourse
  class Page < ActiveRecord::Base
     belongs_to :project
     default_scope  { where(publish: true) }
  end
end
