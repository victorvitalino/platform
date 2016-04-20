require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 1

    CSV.foreach("lib/files/lote_20_04_16.csv", :col_sep => "#") do |row|


           @model = Protocol::Allotment.new({
             id: row[0],
             created_at: row[1],
             description: row[2],
             status: true,
             })

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
