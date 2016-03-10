module Dashboard
  module ApplicationHelper


    def status_helper(status)
      if status
        "<span class='label label-success'>Ativo</span>".html_safe
      else
        "<span class='label label-default'>Inativo</span>".html_safe
      end
    end

  end
end
