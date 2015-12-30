require 'csv'

namespace :csv do
  desc "migração csv"
  task :cadunico => :environment do
    @index = 0
    CSV.foreach("lib/files/renda_familiar.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Candidate::Cadastre.find(row[0])

        begin
          @ref.update(income: row[1])
          #puts @ref.inspect
          puts @index
        rescue Exception => e 
          puts e
        end
     
    end
  end
end