module Cms
  class Nav < ActiveRecord::Base
    belongs_to :link_page, class_name: "Cms::Page"
    belongs_to :link_post, class_name: "Cms::Post"
    belongs_to :category,  class_name: "Cms::NavCategory"

    default_scope { where(publish: true) }


    validates_presence_of :name
    before_create :set_order

    enum :type_nav => [:pagina, :post, :externo]
    enum :target   => [:_blank, :_self]
    private

      def set_order
        @navs = Nav.all.order(:order).last
         if !@navs.present?
           self.order = 0
         else
            self.order = @navs.order.to_i + 1
         end
      end
  end
end
