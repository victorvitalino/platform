require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/encaminhamento.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Firm::EnterpriseCadastre.new({
          cadastre_id: row[0],
          enterprise_id: row[3],
          created_at: row[1],
          status: true
        })

        begin
          @ref.save
          #puts @ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     
    end
  end
end