require 'csv'

namespace :firm do
  desc "migração Cadastros"
  task :enterprise => :environment do
    @index = 0
    CSV.foreach("lib/files/firm_cadastres.csv", :col_sep => ",") do |row|
      
      @index += 1

      @firm = Firm::EnterpriseCadastre.new({
        enterprise_id: 1,
        cadastre_id: row[0],
        status: true,
        created_at: row[3],
      })

      if @firm.save
        puts @index
      else
        puts "CORRE NEGADA"
      end
    end
  end
end