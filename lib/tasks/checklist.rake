require 'csv'

namespace :checklist do
  desc "Systems"
  task :regularization => :environment do
    @index = 0
    CSV.foreach("lib/files/checklist.csv", :col_sep => ",") do |row|
      @index += 1

      @checklist = Candidate::Checklist.new({
        name: row[0],
        program_id: row[1]
      })

      if @checklist.save
        puts @index
      else
        puts "CORRE NEGADA"
      end
    end
  end
end