require 'csv'
require "open-uri"

namespace :csv do
  desc "migração csv"
  task :participation => :environment do

    @candidates = Concourse::Candidate.where(subscribe_id: 3)
    @projects   = Concourse::CandidateParticipation.where(candidate_id: @candidates)

<<<<<<< HEAD
    @projects.each do |participation|

      directory     = "lib/projects/#{participation.id}"
      public_dir    = "public/files/concourse/project/files/"    
      Dir.mkdir("#{directory}") unless File.exists?("#{directory}")

      file_one = File.open("#{public_dir}#{participation.archive_one.to_s.split('/')[5]}",'r').read
      file_two = File.open("#{public_dir}#{participation.archive_two.to_s.split('/')[5]}",'r').read
      file_three = File.open("#{public_dir}#{participation.archive_three.to_s.split('/')[5]}",'r').read
      file_four = File.open("#{public_dir}#{participation.archive_four.to_s.split('/')[5]}",'r').read
      file_five = File.open("#{public_dir}#{participation.archive_five.to_s.split('/')[5]}",'r').read

      write_one   = File.write("#{directory}/1.pdf", file_one)  
      write_two   = File.write("#{directory}/2.pdf", file_two)  
      write_three = File.write("#{directory}/3.pdf", file_three)  
      write_four  = File.write("#{directory}/4.pdf", file_four)  
      write_five  = File.write("#{directory}/5.pdf", file_five)  


    end  
=======
    CSV.foreach("lib/files/complemento.csv", :col_sep => "#") do |row|

       @address = Juridical::Complement.new(
       complement: row[0],
       distribution_date: row[6],
       legal_advice_id: row[3],
       deadline: row[8],
       lawsuit_id: row[13],
       instancy_place_id: row[5],
       days: row[7],
       document_type_id: row[4],
       responsible_lawyer_id: row[9],
       status: row[10],
       advice_type_id: row[12],
       staff_id: row[1].to_i,
       created_at: row[2],
       updated_at: row[11],
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
>>>>>>> 2f1cfb931ca085585164c2eeeec832945a753424
  end
end
