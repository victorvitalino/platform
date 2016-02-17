require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/atualizar_renda16022016.csv", col_sep: "#") do |row|

      @ref = Candidate::Cadastre.find_by_cpf(row[0])

      if @ref.present?
         @ref.income = row[1]
         @ref.save
      end
    #puts @ref.inspect

    puts @index
    @index = @index + 1


    end

  end
end