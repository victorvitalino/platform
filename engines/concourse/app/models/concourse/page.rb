module Concourse
  class Page < ActiveRecord::Base
    belongs_to :project

    extend FriendlyId
  
    friendly_id :title, use: :slugged
    
    validates_presence_of :title, :content
  end
end
