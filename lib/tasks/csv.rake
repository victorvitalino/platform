require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0
    CSV.foreach("lib/files/atualizar_inscritos.csv", :col_sep => "#") do |row|

      @index += 1

      @ref = Candidate::Cadastre.find_by_cpf(row[0]) rescue nil

      if @ref.present?
          @ref.born = row[1]
          @ref.save
          #puts @ref.inspect
          puts @index
        else
          puts "_----------------------------------------------------------------------------------------------------------------_"
        end


    end
  end
end
