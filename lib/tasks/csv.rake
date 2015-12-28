require 'csv'

namespace :csv do
  desc "migração csv"
  task :cadunico => :environment do
    @index = 0
    CSV.foreach("lib/files/schedule/cadunico.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Schedule::DataReference.new({
          name: row[0].to_s.strip.upcase,
          cpf:  row[1].to_s.strip.gsub('.','').gsub('-',''),
          code: 'cadunico1'
        })

        begin
          puts @ref.save!
          puts @index
        rescue Exception => e 
          puts e
        end
     

      
    end
  end
end