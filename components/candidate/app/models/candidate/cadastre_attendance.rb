module Candidate
  class CadastreAttendance < ActiveRecord::Base

    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :cadastre
    belongs_to :cadastre_mirror

    has_many :cadastre_attendance_statuses

    enum attendance_type: ['habitação_habilitado', 'habitação_convocado', 'regularização']
    enum situation: ['parecer do analista', 'parecer do supervisor', 'cancelado']
  end
end

