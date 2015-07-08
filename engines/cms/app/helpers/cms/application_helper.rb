module Cms
  module ApplicationHelper

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
