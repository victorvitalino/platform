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
          gender: (row[2].to_s == "Masculino") ? 1 : 2,
          born: row[3],
          born_uf: row[4].to_s.strip,
          rg: row[5],
          arrival_df: row[8],
          telephone: row[9],
          telephone_optional: row[10],
          celphone: row[11],
          email: row[12],
          special_condition_id: row[13],
          cep: row[14], 
          city_id: row[15],
          address: row[16],
          address_complement: row[17],
          income: row[18],
          work_cep: row[19],
          work_city_id: row[20],
          work_address: row[21],
          civil_state_id: row[22],
          program_id: row[23],
          created_at: row[25],
          cadastre_id: row[26],
          updated_at: row[27]
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