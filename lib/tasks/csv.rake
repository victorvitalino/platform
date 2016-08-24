require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/inativar.csv", :col_sep => "#") do |row|

      @lift = Candidate::EnterpriseCadastre.find_by_cadastre_id(row[0])

      if @lift.present?
        @lift.inactive = true
        @lift.inactive_date = Date.parse(row[1])
        @lift.save
      end
      #puts @lift.inspect
     puts @index += 1

    end
  end
end
