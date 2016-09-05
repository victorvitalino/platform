
namespace :concourse do

  desc "tratamento de arquivos"
  task :cp => :environment do

    itens = Concourse::CandidateParticipation.where(created_at: Time.now - 3.days..Time.now)

    itens.each do |item|
      a1 = IO.read("/home/developer/Workspace/Codhab/platform/lib/files/#{item.archive_one.file.filename}")
      a2 = IO.read("/home/developer/Workspace/Codhab/platform/lib/files/#{item.archive_two.file.filename}")
      a3 = IO.read("/home/developer/Workspace/Codhab/platform/lib/files/#{item.archive_three.file.filename}")
      
      ext = item.archive_three.file.filename.split('.')[1]
      Dir.mkdir "/home/developer/Workspace/Codhab/platform/lib/files/new/#{item.id}"

      IO.write("/home/developer/Workspace/Codhab/platform/lib/files/new/#{item.id}/01.pdf", a1)
      IO.write("/home/developer/Workspace/Codhab/platform/lib/files/new/#{item.id}/02.pdf", a2)
      IO.write("/home/developer/Workspace/Codhab/platform/lib/files/new/#{item.id}/03.#{ext}", a3)

    end

  end

end