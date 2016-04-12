require 'csv'
require "open-uri"

namespace :csv do
  desc "migração csv"
  task :participation => :environment do

    @candidates = Concourse::Candidate.where(subscribe_id: 3)
    @projects   = Concourse::CandidateParticipation.where(candidate_id: @candidates)

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
  end
end
