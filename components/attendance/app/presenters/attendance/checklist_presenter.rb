module Attendance
  class ChecklistPresenter < BasePresenter

    attr_accessor :cadastre_checklist

    def authenticate?(check)
      set_cadastre_checklist(@model.id) 
      
      if @cadastre_checklist.contains?(check) && @cadastre_checklist.authenticate?(check)
        h.link_to "", "#", class: 'btn btn-default glyphicon glyphicon-ok'
      else
        h.link_to "", "#", class: 'btn btn-success glyphicon glyphicon-ok'
      end
    end

    def checked?(check)
      set_cadastre_checklist(@model.id)
    
      if @cadastre_checklist.contains?(check)
        h.link_to "", h.enabled_cadastre_mirror_checklist_uncheck_path(cadastre_mirror_id: @model.id, checklist_id: check.id), remote: true, class: 'btn btn-success default glyphicon glyphicon-ok'
      else
        h.link_to "", h.enabled_cadastre_mirror_checklist_check_path(cadastre_mirror_id: @model.id, checklist_id: check.id), remote: true, class: 'btn btn-default glyphicon glyphicon-ok'
      end
    end

    private

    def set_cadastre_checklist(mirror_id)
      @cadastre_mirror = Candidate::CadastreMirror.find(mirror_id) rescue nil
      @cadastre_checklist = @cadastre_mirror.attendance_cadastre.cadastre_checklists
    end
  end
end