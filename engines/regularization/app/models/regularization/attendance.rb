module Regularization
  class Attendance < Candidate::Attendance
    
    belongs_to :requeriment

    def self.step_one(cpf, requeriment)
      #confirmação de endereço
      insert_attendance(cpf, requeriment, 1) 
    end

    def self.step_two(cpf, requeriment)
      #atualização cadastral
      insert_attendance(cpf, requeriment, 2) 
    end

    def self.step_three(cpf, requeriment)
      #preenchimento de checklists
      insert_attendance(cpf, requeriment, 3)  
    end


    def self.insert_attendance(cpf, requeriment, status_id)
      attendance  = Candidate::Attendance.where(cpf: cpf, requeriment_id: requeriment, status: true,attendance_status_id: status_id)
      status      = Candidate::AttendanceStatus.find_by_code(status_id)

      if attendance.empty?
        self.create({cpf: cpf,status: true,attendance_status_id: status_id, requeriment_id: requeriment})
        update_status(cpf, requeriment, status.id)
      end
    end

    def self.update_status(cpf, requeriment_id, status_id)
      Candidate::Attendance.where('cpf = ? AND 
                                   requeriment_id = ? AND
                                   attendance_status_id <> ? AND
                                   status = ?', cpf, requeriment_id, status_id, true).update_all(status: false)
    end
  end
end