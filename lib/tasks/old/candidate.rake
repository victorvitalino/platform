require 'csv'

namespace :candidate do
  desc "migração Cadastros"
  task :mirror_2011 => :environment do
    @index = 0
    CSV.foreach("lib/files/cadastre_mirror_2011.csv", :col_sep => "#") do |row|
      @index += 1

        @cadastre = Candidate::CadastreMirror.new({
          name: row[0].to_s.strip.upcase,
          cpf:  row[1].to_s.strip,
          gender: (row[2].to_i == 3) ? 2 : row[2].to_i,
          born: row[3],
          born_uf: row[4].to_s.strip,
          rg: row[6],
          arrival_df: row[7],
          email: row[8],
          special_condition_id: row[9],
          cep: row[10], 
          city_id: row[11],
          address: row[12],
          address_complement: row[13],
          income: row[14],
          work_city_id: row[16],
          work_address: row[17],
          civil_state_id: row[18],
          program_id: row[19],
          cadastre_id: row[20],
          created_at: (row[21].present?) ? row[21] : row[22],
          updated_at: Date.parse('15/09/2012')
        })

        begin 
          puts @cadastre.save
          puts @index
        rescue
          puts "DEU RUIM"
        end
     

      
    end
  end
end