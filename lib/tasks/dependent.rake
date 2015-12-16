require 'csv'

namespace :candidate do
  desc "migração Cadastros"
  task :dependent_2012 => :environment do
    @index = 0
    CSV.foreach("lib/files/dependent_mirror_2012.csv", :col_sep => "#") do |row|
      @index += 1

        @cadastre = Candidate::DependentMirror.new({
          name: row[0].to_s.strip.upcase,
          kinship_id: row[1],
          born: row[2],
          gender: (row[3].to_i == 3) ? 2 : row[3],
          special_condition_id: row[4],
          special_condition_flag: row[5],
          income: row[6],
          cpf:  row[7].to_s.strip,
          cadastre_mirror_id: row[8],
          created_at: Date.parse('15/09/2012')
        })

        begin 
          puts @cadastre.save
          puts @index
        rescue
          puts "DEU RUIM"
        end
      
    end
  end

  task :voi => :environment do 
    @index = 0
    CSV.foreach("lib/files/voi_estrutural.csv", :col_sep => "#") do |row|
      @index += 1

        @cadastre = Candidate::Voi.new({
          name: row[0].to_s.strip.upcase,
          address: row[1],
          cpf: row[3],
          rg: row[4],
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