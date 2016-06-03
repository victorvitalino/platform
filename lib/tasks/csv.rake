require 'csv'
require "open-uri"

namespace :csv do

  desc "migração de log"
  task :log => :environment do

    @index = 0

    CSV.foreach("lib/files/renda.csv", :col_sep => "#") do |row|


           @model = Candidate::Cadastre.find_by_cpf(row[0])

           if @model.present?
             @model.income = row[1]
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
