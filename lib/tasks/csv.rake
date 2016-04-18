require 'csv'
require "open-uri"

namespace :csv do
  desc "migração csv"
  task :renda => :environment do

=begin
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
    @index = 0

<<<<<<< HEAD
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
=======
    CSV.foreach("lib/files/renda.csv", :col_sep => "#") do |row|

      @candidate = Candidate::Cadastre.find_by_cpf(row[0]) rescue nil

      if @candidate.present?
        @candidate.update(income: row[1])
        #puts @candidate.income
      else
        puts "RETORNOU NIL"
>>>>>>> ebec38da2cfd01e0cbad00d7b0b332aaeabcc960
      end

      @index += 1

      puts @index

=end
    end
  end
end
