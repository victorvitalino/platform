module Concourse
  class Nav < ActiveRecord::Base
    belongs_to :page
    belongs_to :project
    belongs_to :father, class_name: "Concourse::Nav"

    default_scope { where(publish: true) }

    enum action: [:pagina, :url_externa]
    enum target: [:normal,:blank]
    
    validates_presence_of :name, :target, :action
    validates :action, inclusion: { in: Concourse::Nav.actions }
    validates :target, inclusion: { in: Concourse::Nav.targets }
    validates :page_id, presence: true, if: :internal_page?
    validates :external_url, presence: true, if: :external_page?

    before_create :set_order

    def up_order
      @last_number = self.order.to_i
      @next_number = @last_number - 1
      
      @next_nav = project.navs.find_by_order(@next_number)
      @last_nav = project.navs.find_by_order(@last_number)
      
      @next_nav.update(order: @current_number)
      @last_nav.update(order: @next_nav)
    end

    def self.down_order
    end

    private

    def set_order
      @last = project.navs.order(:order).last

      if @last.present? && @last.order.present?
        self.order = @last.order.to_i + 1
      else
        self.order = 1
      end
    end

    def internal_page?
      self.pagina?
    end

    def external_page?
      self.url_externa?
    end

  end
end
