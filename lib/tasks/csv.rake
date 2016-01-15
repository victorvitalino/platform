require 'csv'

namespace :csv do
  desc "migração csv"


  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/cadunico2.csv", :col_sep => "#") do |row|
      @index += 1

       @ref = Schedule::DataReference.new({
          cpf: row[3].to_s.rjust(11,'0'),
          name: row[2].to_s,
          code: 'cadunico1'
        })

        begin
          @ref.save
         # puts @ref.inspect
          puts @index
        rescue Exception => e
          puts e
        end

    end
  end
end