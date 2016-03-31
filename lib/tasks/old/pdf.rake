namespace :pdf do
  desc "trabalhando com pdf"
  task :open => :environment do
    reader = PDF::Reader.new("public/concourse/teste.pdf")
    byebug
  end
end