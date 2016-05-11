namespace :db do

    desc "backup database"
    task :backup, :db, :user do |task, args|
        puts args
        cmd = nil
        cmd = "pg_dump -F c -v -h 10.233.38.16 -U #{args.user} -d #{args.db} -f #{Rails.root}/db/backups/#{Time.now.strftime("%Y%m%d%H%M%S")}_#{args.db}.psql"
        
        puts cmd
        exec cmd
    end

    desc "Restores the database from backups"
    task :restore, [:date] => :environment do |task,args|
        if args.date.present?
            cmd = nil
            with_config do |app, host, db, user|
                cmd = "pg_restore -F c -v -c -C #{Rails.root}/db/backups/#{args.date}_#{db}.psql"
            end
            Rake::Task["db:drop"].invoke
            Rake::Task["db:create"].invoke
            puts cmd
            exec cmd
        else
            puts 'Please pass a date to the task'
        end
    end

    private

    def with_config
        yield Rails.application.class.parent_name.underscore,
        ActiveRecord::Base.connection_config[:host],
        ActiveRecord::Base.connection_config[:username]
    end

    task :teste, [:host, :user, :database] do |task, args|
      if args.present?
        cmd = nil 
        cmd = "pg_dump -F c -v -h #{args.host} -U #{args.user} -d #{args.database} -f #{Rails.root}/db/backups/#{Time.now.strftime("%Y%m%d%H%M%S")}_#{args.database}.psql"
        
        puts cmd
        exec cmd
      else
        puts "Falta argumentos - HOST, USER, DATABASE"
      end  
    end


    task :voltar, [:host, :user, :database,:date] do |task, args|
      if args.present?
        cmd = nil
        cmd = "pg_restore -F c -v -c -C -h #{args.host} -U #{args.user} #{Rails.root}/db/backups/#{args.date}_#{args.database}.psql"
        puts cmd
        exec cmd
      else
        puts "Falta argumentos HOST, USER, DATABASE, NUMBER"
      end
    end
end