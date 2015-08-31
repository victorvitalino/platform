module Concourse
  class Nav < ActiveRecord::Base
    belongs_to :project
    belongs_to :page

    default_scope {where(:publish => true).order(:order)}

    enum :target  => [:_blank, :_self]
    enum :action => ['url', 'página']

    validates_presence_of :label, :target, :action

    validates :url,   presence: true, if: :is_url?
    validates :page,  presence: true, if: :is_page?
    
    before_create :set_order

    private

    def is_url?
      self.url?
    end

    def is_page?
      self.página?
    end

    def set_order
      @navs           = Nav.all
      current_order   = @navs.last

      self.order    = (current_order.present? && current_order.order >= 0) ? current_order.order + 1 : 0 if @navs.present?
    end
  end
end
