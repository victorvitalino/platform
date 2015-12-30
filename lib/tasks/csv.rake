require 'csv'

namespace :csv do
  desc "migração csv"
  task :cadunico => :environment do
    @index = 0
    CSV.foreach("lib/files/cadastro_empresas.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Firm::EnterpriseCadastre.new({
          enterprise_id: row[3],
          cadastre_id: row[4],
          status: true,
          created_at: (row[0].to_s == "NULL") ? row[1] : row[0]
        })

        begin
          @ref.save
          #@ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     
    end
  end
end