require 'csv'

namespace :csv do
  desc "migração csv"


  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/recanto.csv", :col_sep => "#") do |row|
      @index += 1

       @ref = Schedule::DataReference.new({
          name: row[0],
          cpf: row[1].to_s.gsub('.','').gsub('-',''),
          code: 'cadunico1'
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