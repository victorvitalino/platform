require 'csv'

namespace :csv do
  desc "migração csv"


  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/atualizar3.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Candidate::Cadastre.find_by_cpf(row[0]) rescue nil

        @ref.income = row[1] if @ref.present?

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