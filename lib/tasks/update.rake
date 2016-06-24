require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/indica.csv", :col_sep => "#") do |row|


           @model = Firm::EnterpriseCadastre.new(
           enterprise_id: 1,
           cadastre_id: row[0],
           status: true,
           created_at: row[1],
           source_list: row[2],

           )

          #puts @model.inspect

          @model.save



          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

       puts  @index += 1

    end
  end

end
