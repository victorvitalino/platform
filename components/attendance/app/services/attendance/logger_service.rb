module Attendance
  class LoggerService
    
    attr_accessor :cadastre_id,
                  :cadastre_mirror_id,
                  :situation_id,
                  :attendance_type,
                  :staff_id,
                  :supervisor_id,
                  :critical,
                  :schedule_id

    def initialize(options = {})
      @cadastre_id        = options[:cadastre_id]        ||= nil
      @cadastre_mirror_id = options[:cadastre_mirror_id] ||= nil
      @status             = options[:status]             ||= false
      @attendance_type_id = options[:attendance_type_id] ||= nil
      @staff_id           = options[:staff_id]           ||= nil
      @supervisor_id      = options[:supervisor_id]      ||= nil
      @schedule_id        = options[:schedule_id]        ||= nil
      @start              = options[:start]              ||= Time.now
      @end                = options[:end]                ||= nil
    end


    def write_logger
      attendance = Attendance::Cadastre.new({
        cadastre_id:        @cadastre_id,
        cadastre_mirror_id: @cadastre_mirror_id,
        attendance_type_id: @attendance_type_id,
        program_id:         set_program,
        staff_id:           @staff_id,
        supervisor_id:      @supervisor_id,
        schedule_id:        @schedule_id,
        start:              @start,
        end:                @end,
        status:             @status
      })

      return nil if !attendance.save 
    end

    def cancel_logger
    end

    private

    def set_program
      cadastre = Candidate::Cadastre.find(@cadastre_id) rescue nil
      return nil if cadastre.nil?
      cadastre.program_id
    end

  end
end