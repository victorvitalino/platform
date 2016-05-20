require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/lotes.csv", :col_sep => "#") do |row|

           #staff = Person::Staff.find_by_code(row[3]).id rescue nil


           @model = Indication::Allotment.new(
           step_id: row[9],
           zone: row[10],
           demand: row[0],
           rii: row[1],
           rie: row[2],
           old: row[4],
           special: row[5],
           vulnerable: row[3],
           created_at: row[6],
           status: true,
           )

          #puts @model.inspect
          @model.save!

        #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
        #  end


       puts  @index += 1

    end
  end

end
