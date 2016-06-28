require 'csv'
require "open-uri"

namespace :update do

  desc "migração de log"
  task :firm => :environment do

    @index = 0


    CSV.foreach("lib/files/protocol.csv", :col_sep => "#") do |row|

        begin
           @teste = Protocol::Assessment.new(
           number: row[1],
           year: row[3],
           prefex: row[2],
           document_number: row[4],
           external_number: row[13],
           requesting_unit: row[14].present? ? row[14].strip : nil,
           external_agency: row[12],
           recipient: row[6].present? ? row[6].strip : nil,
           address: row[7].present? ? row[7].strip : nil,
           cpf: row[8],
           cnpj: row[9],
           sign_by: row[16].present? ? row[16].strip : nil,
           observation: row[15].present? ? row[15].strip : nil,
           description_subject: row[10].present? ? row[10].strip : nil,
           document_type_id: row[5],
           subject_id: row[19],
           staff_id: row[17],
           sector_id: row[18],
           id_old: row[0],
           created_at: row[11]
           )

          puts Protocol::Assessment.all.count

          puts @teste.save
        rescue => ex
         puts ex.message
        end

          #    puts "EROOOOOOOREOROEOROEROEOROEOROEOROEOER #{@index}"
          #  end

       puts  @index += 1

    end
  end
end
