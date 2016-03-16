require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0
    CSV.foreach("lib/files/cadin.csv", :col_sep => "#") do |row|

        cpf = ''
        if row[11].to_s.strip.present?
         cpf = row[11].to_s.gsub('.','')
         cpf = cpf.gsub('-','')
        end

        @address = Candidate::Cadin.new({
          number_control: row[0],
          name:  row[1].to_s.strip,
          born: row[2],
          process: row[3],
          occurrence_cadin_id: row[4],
          signed_instrument_id: row[5],
          place_birth: row[6].to_s.strip,
          uf_born: row[7].to_s.strip,
          address: row[8].to_s.strip,
          cep: row[9],
          city_id: row[10],
          cpf: cpf,
          rg: row[12].to_s.strip,
          distribution_date: row[13],
          percentage: row[14],
          observation: row[15],
          espolio: row[16],
          freedup: row[17],
        })

        begin
          @address.save
          #puts @address.inspect
          puts @index
        rescue
          puts "#{@index}------------------------------------------------------------------------------------------------------------------"
        end

      @index += 1

    end
  end
end
