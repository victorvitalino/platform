module Dashboard
  module ApplicationHelper


    def status_helper(status)
      if status
        "<span class='label label-success'>Ativo</span>".html_safe
      else
        "<span class='label label-default'>Inativo</span>".html_safe
      end
    end

    def warning_loop(limit = 10, order = 'ASC', category = 1)
      @warnings = Dashboard::Warning.where(publish: true).where(category: category).limit(limit).order("id DESC")

      @warnings.each do |w|
        yield w
      end
    end

  end
end
