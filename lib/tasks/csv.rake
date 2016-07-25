require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/inactive.csv", :col_sep => "#") do |row|

      @lift = Candidate::EnterpriseCadastre.where(cadastre_id:row[0],enterprise_id:12).last

      if @lift.present?
        #puts l.cnpj
        @lift.inactive = true
        @lift.inactive_date = row[1]
        @lift.save
      end
      #puts @lift.inspect
     puts @index += 1

    end
  end
end
