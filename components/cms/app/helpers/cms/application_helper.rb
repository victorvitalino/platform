module Cms
  module ApplicationHelper

    def link_each(category)
      @category = Cms::NavCategory.find_by_name(category)
      if @category.present? && @category.navs.present?
        @category.navs.each do |n|
          yield n
        end
      end
    end
    def link_to_nav(nav)
      if nav.pagina?
        link_to nav.name
      else
        link_to nav.name
      end
    end
  	def nav_each(category, limit)
  	end

    def status_helper(status)
      if status
        "<span class='label label-success'>Ativo</span>".html_safe
      else
        "<span class='label label-default'>Inativo</span>".html_safe
      end
    end

  end
end
