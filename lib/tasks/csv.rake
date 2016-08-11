require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/update_insc.csv", :col_sep => "#") do |row|

      @lift = Candidate::CadastreMirror.find(row[2])

      if @lift.present?
       if row[1].to_s != "NULL" && row[0].to_s != "NULL"
        @lift.created_at = row[1].to_s == "NULL" ? row[0] : row[1]
        @lift.save
       end
      end
      #puts @lift.inspect
     puts @index += 1

    end
  end
end
