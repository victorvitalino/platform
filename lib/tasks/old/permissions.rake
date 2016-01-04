namespace :permission do
  desc "Systems"
  task :person => :environment do
    Person::System.create([
      {name: "Gestão de pessoas", code: 1, status: true},
      {name: "Dashboard",         code: 2, status: true},
      {name: "Gestão site",       code: 3, status: true},
    ])
  end
  
  desc "Permissions for ::Person"
  task :person => :environment do
  end
  
  desc "Permissions for ::Cms"
  task :cms => :environment do
  end
  
  desc "Permissions for ::Helpdesk"
  task :helpdesk => :environment do
  end
  
  desc "Permissions for ::Sefaz"
  task :sefaz => :environment do
  end
   
  desc "Permissions for ::Entity"
  task :sefaz => :environment do
  end
end
