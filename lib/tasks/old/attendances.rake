require 'csv'

namespace :candidate do
  desc "migração Cadastros"
  task :attendances => :environment do
    @index = 0
    CSV.foreach("lib/files/candidato_status_1.csv", :col_sep => "#") do |row|
      
      @index += 1

      @attendance = Candidate::Attendance.new({
        cadastre_id: row[0],
        cadastre_mirror_id: row[0],
        convocation_id: row[1],
        attendance_status_id: row[2],
        status: row[3],
        created_at: row[4]
      })

      if @attendance.save
        puts @index
      else
        puts "CORRE NEGADA"
      end
    end
  end
end