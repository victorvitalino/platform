require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/person.csv", :col_sep => "#") do |row|

           #staff = Person::Staff.find_by_code(row[3]).id rescue nil


           @model = Person::Staff.new(
           name: row[0],
           cpf: row[1],
           rg: row[2],
           rg_org: row[3],
          code: row[4],
           blood_type: row[5],
           email:row[7],
           email: "@",
           start_hour:row[8],
           end_hour: row[9],
           date_contract: row[10],
           status: true,
           job_id: row[12],
           sector_origin_id: row[14],
           sector_current_id: row[15],
           password: "12345678",
           created_at: row[13],
           token_status: true,
           wekeend: false,
           )

          puts @model.inspect
          @model.save!

        #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
        #  end


       puts  @index += 1

    end
  end

end
