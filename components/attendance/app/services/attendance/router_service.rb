module Attendance
  class RouterService
    
    attr_accessor :cadastre_id, :cadastre, :view, :url
    
    def initialize(attendance, view)
      @view     = view
      @cadastre = set_cadastre(attendance.cadastre_id)
      @mirror   = set_cadastre_mirror(attendance.cadastre_mirror_id)
    end

    def routing!
      return nil if @cadastre.nil?

      if @cadastre.program_id == 3
        
      else
        case @cadastre.current_situation_id
        when 3
          @url = h.edit_convoke_cadastre_mirror_path(@mirror)
        when 4
          @url = h.edit_enabled_cadastre_mirror_path(@mirror)
        end
      end

      return @url
    end

    private

    def set_cadastre(id)
      Candidate::Cadastre.find(id) rescue nil
    end

    def set_cadastre_mirror(id)
      Candidate::CadastreMirror.find(id) rescue nil
    end

    def h
      @view
    end

  end
end