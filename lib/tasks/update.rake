require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


     CSV.foreach("lib/files/users.csv", :col_sep => "#") do |row|


           @teste = Person::Staff.new(
           name: row[1],
           cpf: row[2],
           rg: row[3],
           rg_org: row[4],
           code: row[5],
           blood_type: row[6],
           born: row[7],
           email: "@codhab.df",
           start_hour: row[9],
           end_hour: row[10],
           date_contract: row[11],
           sector_origin_id: row[12],
           sector_current_id: row[13],
           job_id: row[14],
           password: "12345678"
           )

           #puts @teste.inspect
           @teste.save

           puts @index + 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end



    #select cnpj from protocol_assessments where cnpj is not null and length(cnpj) = 13

  end
end
