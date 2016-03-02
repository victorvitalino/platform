
namespace :part do
  task :pdf => :environment do
    @parts = Concourse::CandidateParticipation.all.order(:id)

    @parts.each do |part|

      if !File.directory?("public/projects/copy/#{part.id}")
        Dir.mkdir "public/projects/copy/#{part.id}"
      end

      file_one    = File.open("public/projects/original/#{part.archive_one.file.original_filename}")
      file_two    = File.open("public/projects/original/#{part.archive_two.file.original_filename}")
      file_three  = File.open("public/projects/original/#{part.archive_three.file.original_filename}")
      file_four   = File.open("public/projects/original/#{part.archive_four.file.original_filename}")
      file_five   = File.open("public/projects/original/#{part.archive_five.file.original_filename}")

      FileUtils.cp(file_one, "public/projects/copy/#{part.id}/01.pdf")
      FileUtils.cp(file_two, "public/projects/copy/#{part.id}/02.pdf")
      FileUtils.cp(file_three, "public/projects/copy/#{part.id}/03.pdf")
      FileUtils.cp(file_four, "public/projects/copy/#{part.id}/04.pdf")
      FileUtils.cp(file_five, "public/projects/copy/#{part.id}/05.pdf")
    end  
  end
end
