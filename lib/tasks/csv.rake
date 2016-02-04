require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do
    @index = 0


    CSV.foreach("lib/files/renda.csv", :col_sep => "#") do |row|
      @index += 1

      @ref = Candidate::Cadastre.find_by_cpf(row[1]) rescue nil

      begin
        if @ref.present?
          @ref.income = row[0]
          @ref.save
        end
        #puts @ref.inspect
        puts @index
      rescue Exception => e
        puts e
      end

    end
  end
end