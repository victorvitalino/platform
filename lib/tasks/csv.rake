require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/pontuationrie.csv", :col_sep => "#") do |row|
      @index += 1

       @ref = Candidate::Pontuation.new({
          cadastre_id: row[0],
          cadastre_mirror_id: row[0],
          code: row[7],
          bsb: row[1],
          dependent: row[2],
          timelist: row[3],
          special_condition: row[4],
          income: row[5],
          total: row[6],
          program_id: 2
        })

        begin
          @ref.save
          #puts @ref.inspect
          puts @index
        rescue Exception => e
          puts e
        end

    end
  end
end