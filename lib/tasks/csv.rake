require 'csv'

namespace :csv do
  desc "migração csv"
  task :cadunico => :environment do
    @index = 0
    CSV.foreach("lib/files/firm.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Firm::EnterpriseStatus.new({
          cadastre_id: row[5],
          enterprise_cadastre_id: row[6],
          status_cadastre_id: row[1],
          observation: row[2],
          archive_file: row[3],
          created_at: row[0]
        })

        begin
          puts @ref.save!
          #puts @ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     

      
    end
  end
end