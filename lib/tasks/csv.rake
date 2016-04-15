require 'csv'

namespace :csv do
  desc "migração csv"
  task :treta => :environment do

    @index = 0

    CSV.foreach("lib/files/vinculo_entidade.csv", :col_sep => "#") do |row|

       @address = Entity::OldCandidate.new(
       old_id: row[1],
       cadastre_id: row[0],
       )

      begin
        @address.save
        #puts @address.inspect
        puts @index
      rescue e => Exception
        puts e
      end

      @index += 1

    end
  end
end
