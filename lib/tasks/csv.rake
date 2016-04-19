require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 1

    CSV.foreach("lib/files/LogRenda.csv", :col_sep => "#") do |row|

      @model = Candidate::CadastreActivity.new({
        cadastre_id: row[0],
        observation: row[1],
        created_at: row[2],
        type_activity: 0,
        type_ocurrency: 1,
        status: true,
        activity_status_id: 2
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
