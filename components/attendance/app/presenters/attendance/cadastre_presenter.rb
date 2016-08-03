module Attendance
  class CadastrePresenter < BasePresenter
    
    attr_accessor :list_navs

    def situation
      case @model.status
      when 'cancelado'
        h.content_tag(:span, 'Cancelado', class: 'label label-danger')
      when 'pendente'
        h.content_tag(:span, 'Pendente', class: 'label label-warning')
      when 'finalizado'
        h.content_tag(:span, 'Finalizado', class: 'label label-success')
      end
    end


  end
end