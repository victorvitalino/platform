require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0



     CSV.foreach("lib/files/deps.csv", :col_sep => "#") do |row|


           @teste = Candidate::Dependent.new(
           cadastre_id: row[9],
           name: row[0],
           cpf: row[1].present? ? row[5].gsub('.','').gsub('-','') : nil,
           rg: row[8],
           born: row[3],
           gender: row[4].to_i,
           income: row[6],
           kinship_id: row[2],
           cid: row[7],
           special_condition_id: row[5],
           )
           @teste.save

           #puts @teste.inspect

           puts @index += 1
       end
          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

  end
end
