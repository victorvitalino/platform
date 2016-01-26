require 'csv'

namespace :csv do
  desc "migração csv"


  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/indicacao.csv", :col_sep => "#") do |row|
      @index += 1

        @ref = Firm::EnterpriseCadastre.where(cadastre_id: row[2], enterprise_id: row[3]).last

        if @ref.present?
          @ref.status = row[0]
          @ref.source_list = row[4]
        end

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