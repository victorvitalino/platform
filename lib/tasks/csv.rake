require 'csv'

namespace :csv do
  desc "migração csv"
  task :renda => :environment do

    @index = 0

    CSV.foreach("lib/files/localizacao.csv", :col_sep => "#") do |row|

        #cpf = ''
        #if row[2].to_s.strip.present?
         #cpf = row[2].to_s.gsub('.','')
         #cpf = cpf.gsub('-','')
        #end

        @address = Protocol::Location.new({
          assessment_id:  row[10],
          staff_id:  row[9],
          sector_id:  row[8],
          shelf: row[3],
          pile: row[4],
          created_at: row[2],
          box: row[5],
          observation: row[6],
        })


        if !@candidate.nil?
          @candidate.income = row[0]
          #@candidate.save
          #puts @candidate.inspect
          puts @index
        end

      @index += 1

    end
  end
end
