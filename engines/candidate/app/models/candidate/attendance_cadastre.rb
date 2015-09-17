module Candidate
  class AttendanceCadastre < ActiveRecord::Base
    belongs_to :adjunct_cadastre
    belongs_to :attendance_status
    belongs_to :attendant, class_name: "Attendance::Attendant"

    belongs_to :requeriment, class_name: "Regularization::Requeriment"

    default_scope { where(status: true)}
  end
end
