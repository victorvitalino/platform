require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/selagem.csv", :col_sep => "#") do |row|

      @lift = Visit::Lifting.new 
      @lift.localization  = row[0].upcase
      @lift.name  = row[1].downcase
      @lift.cpf   = row[2].to_s.gsub('.','').gsub('-','')
      @lift.rg    = row[3]
      @lift.phone = row[4]
      #@lift.save
    end
  end

end
