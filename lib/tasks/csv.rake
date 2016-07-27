require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/renda.csv", :col_sep => "#") do |row|

      @lift = Candidate::Cadastre.find_by_cpf(row[0])

      if @lift.present?
        #puts l.cnpj
        @lift.income = row[1]
        @lift.save
      end
      #puts @lift.inspect
     puts @index += 1

    end
  end
end
