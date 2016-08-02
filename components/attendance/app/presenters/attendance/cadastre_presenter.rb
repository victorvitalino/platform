module Attendance
  class CadastrePresenter < BasePresenter
    
    attr_accessor :list_navs

    def teste
    end

    def dropdown_navs

      @list_navs = {}
=begin
      if !@model.program_id == 3
        case @model.current_situation_id
        when 4
          content_tag(:ul, :class => 'a class') do
            a.collect do |item|
              content_tag(:li, item)
            end.join.html_safe
          end
        when 3

        else
        end
      else

      end
=end
    end

    private

    def enabled_navs
      ""
    end

  end
end