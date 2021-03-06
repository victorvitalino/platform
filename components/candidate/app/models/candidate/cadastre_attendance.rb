module Candidate
  class CadastreAttendance < ActiveRecord::Base

    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :attendance_status
    belongs_to :cadastre
    belongs_to :cadastre_mirror

    def self.initialize_attendance!(cadastre, staff_id)
      return false if cadastre.nil? || staff_id.nil?
      if cadastre.cadastre_attendances.present?
        if %w(4 7 5).include? cadastre.cadastre_attendances.last.attendance_status_id.to_s 
          return false
        end
      end

      mirror = cadastre.cadastre_mirrors.new
      mirror.set_clone(cadastre.attributes)
      mirror.save
      mirror.set_clone_dependent(cadastre.dependents)
            
      attendance = self.new
      attendance.cadastre_id = cadastre.id
      attendance.cadastre_mirror_id = mirror.id
      attendance.cadastre_mirror_id = mirror.id
      attendance.attendance_status_id = self.set_status_id(cadastre)
      attendance.staff_id = staff_id

      attendance.save
    end

    def supervisor?
      self.attendance_status == 5
    end

    def self.set_status_id(cadastre)
      procedural = cadastre.cadastre_procedurals
      if procedural.present?
        case procedural.last.procedural_status_id
        when 7
          # => retorna o parecer do supervisor
          # => o problema que pode acontecer aqui é o fator dos cadastros antigos não obterem o mirro para finalização de atendimento. 
          5 
        when 14
          7 # => parecer do gerente. galera habilitada.
        else
          8 # => atendimento com problema de criação
        end
      else
        4 # => retorna parecer do analista
      end
    end

    private
    
    def create_mirror(attributes = {})
      attributes.each do |key, value|
        unless %w(id created_at updated_at).include? key
          self[key] = value if self.attributes.has_key?(key)
        end
      end
    end


  end
end

