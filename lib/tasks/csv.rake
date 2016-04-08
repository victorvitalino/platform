require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/localInsancia.csv", :col_sep => "#") do |row|

       @address = Juridical::InstancyPlace.new(
       name: row[0],
       description: row[1],
       status: true,
       instancy_id: row[2]
       )

      begin
        @address.save
        #puts @address.inspect
        puts @index
      rescue e => Exception
        puts e
      end

      @index += 1

    end
  end
end
