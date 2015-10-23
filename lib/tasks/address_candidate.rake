require 'csv'

namespace :candidate do
  desc "migração Cadastros"
  task :address_candidate => :environment do
    @index = 0
    CSV.foreach("lib/files/candidato_status_1.csv", :col_sep => "#") do |row|
      
      @index += 1

      @attendance = Candidate::CadastreAddress.new({
        cadastre_id: row[0],
        cadastre_mirror_id: row[0],
        dominal_chair: row[1],
        type_receiving: row[2],
        type_occurence: row[3],
        unit: row[4],
      })

      if @attendance.save
        puts @index
      else
        puts "CORRE NEGADA"
      end
    end
  end
end