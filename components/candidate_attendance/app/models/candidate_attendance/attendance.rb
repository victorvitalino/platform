module CandidateAttendance
  class Attendance

    include ActiveModel::Model

    attr_accessor :staff_id, :status_id, :cadastre_id

    def initialize(options = {})
      self.staff_id = options[:staff_id]
      self.cadastre_id = options[:cadastre_id]

      create_attendance!
    end

    # => callbacks
    def create_attendance!
    end

    def finish_attendance!
    end

    # => functions for story case
    def create_cadastre_mirror(cadastre_id)
    end

    def create_dependents_mirror(cadastre_id)
    end

    # => return updates
    def update_general_cadastre(attributes = {})
    end

    def update_general_dependents(object = {})
    end

    # => procedural questions
    def create_assessment
    end

    # => attendant questions
    def supervisor_conclusion(options = {})
    end

    def attendance_conclusion(options = {})
    end

    # => regulazation functions

    def requeriment_save!
    end
  end
end