module Concourse
  class Nav < ActiveRecord::Base
    belongs_to :project
    belongs_to :page

    enum :target  => [:_blank, :_self]
    enum :action => ['url', 'página']

    validates_presence_of :label, :target, :action

    validates :url,   presence: true, if: :is_url?
    validates :page,  presence: true, if: :is_page?
    
    private

    def is_url?
      self.url?
    end

    def is_page?
      self.página?
    end
  end
end
