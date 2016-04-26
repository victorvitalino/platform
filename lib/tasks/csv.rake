require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/herdeiro.csv", :col_sep => "#") do |row|


           @model = Protocol::Assessment.find_by_id_old(row[0])

           if @model.present?
             @model.requesting_unit = row[1]
             @model.external_agency = row[2]

           end


          begin
            @model.save
            #puts @model.inspect
          rescue
            puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          end


       puts  @index += 1

    end
  end

end
