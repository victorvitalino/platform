module Attendance
  class ActionPresenter < BasePresenter
    
    include Authenticate::StaffService
    
    def dropdown_actions
      if policy(:action, namespace: Attendance).allow_action?
        h.content_tag(:div, class: 'btn-group') do 
          h.concat(cog_button)
          h.concat(list_actions)
        end
      else
        h.content_tag(:div, 'Sem ação') 
      end
    end


    def initialize_action

      @attendance_loggers = @model.attendance_loggers.where(status: 0)
      if !@attendance_loggers.present?
        if @model.program_id != 3
          case @model.current_situation_id
          when 3
            h.link_to "Iniciar processo de habilitação", h.convoke_cadastre_mirror_init_path(@model.id), class: 'pull-right bold'
          when 4
            h.link_to "Iniciar novo atendimento", h.enabled_cadastre_mirror_init_path(@model.id), class: 'pull-right bold'
          end
        else
          h.link_to "Iniciar novo atendimento", h.regularization_cadastre_mirror_init_path(@model.id), class: 'pull-right bold'
        end
      else
        h.content_tag(:b, "#{@attendance_loggers.count} atendimento pedente", class: 'warning pull-right')
      end
    
    end

    private

    def cog_button
      h.content_tag(:button, class: ['btn','btn-default','dropdown-toggle'], aria: {expanded: false, 'haspopup': true}, data: { toggle: 'dropdown'}) do 
        h.concat(h.content_tag(:i, '', class: ['glyphicon', 'glyphicon-cog']))
        h.concat(h.content_tag(:span, '', class: 'caret'))
      end
    end

    def list_actions
      h.content_tag(:ul, class: 'dropdown-menu') do
        actions.collect { |action| h.concat(h.content_tag(:li, action))}
      end 
    end

    def actions
      arr = []

      if policy(:action, namespace: Attendance).continue?
        arr << h.content_tag(:a, 'Detalhar', href: h.detail_resume_path(@model))
      end
      
      if @model.pendente?
        if policy(:action, namespace: Attendance).continue?
          arr << h.content_tag(:a, 'Continuar atendimento', href: h.detail_continue_path(@model))
        end

        if policy(:action, namespace: Attendance).cancel?
          arr << h.content_tag(:a, 'Cancelar', href: h.detail_cancel_path(@model), data: { remote: true })
        end
      end
      
      return arr
    end
  end
end



=begin
              .btn-group{:role => "group"}
                %button.btn.btn-default.dropdown-toggle{"aria-expanded" => "false", "aria-haspopup" => "true", "data-toggle" => "dropdown", :type => "button"}
                  %i.glyphicon.glyphicon-cog
                  %span.caret
                %ul.dropdown-menu
                  %li
                    = link_to 'sads'
=end