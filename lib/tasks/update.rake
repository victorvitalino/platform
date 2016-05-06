require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0

    CSV.foreach("lib/files/deps2.csv", :col_sep => "#") do |row|

           staff = Person::Staff.find_by_code(row[3]).id rescue nil

           @model = Candidate::CadastreActivity.new(
           cadastre_id: row[4],
           staff_id: staff,
           activity_status_id: 5,
           type_activity: 4,
           status: true,
           type_ocurrency:row[5],
           observation:"#{row[0]} - #{row[2]}",
           created_at:row[1],
           )


          @model.save!
            #puts @model.inspect
        #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
        #  end


       puts  @index += 1

    end
  end

end
