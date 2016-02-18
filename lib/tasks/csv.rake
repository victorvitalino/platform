require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0
    CSV.foreach("lib/files/inscricao_atualizar.csv", :col_sep => "#") do |row|

      @index += 1

      @ref = Candidate::CadastreMirror.where(cadastre_id: row[2]) rescue nil

      if @ref.present?
        @created_at = (row[1] == "NULL") ? row[0] : row[1]

        if @ref.update_all(created_at: @created_at)
          puts @index
        else
          puts "_----------------------------------------------------------------------------------------------------------------_"
        end
      end

    end
  end
end
