require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/log2.csv", :col_sep => "#") do |row|


           @model = Candidate::EnterpriseCadastre.where(enterprise_id: row[2], cadastre_id: row[0]).first

           if @model.present?
             @model.inactive = true
             @model.inactive_date = row[1].to_s == "NULL" ? "" : row[1]
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
