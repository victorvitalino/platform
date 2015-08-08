namespace :protocol do

  desc "Migração de lote"
  task :alloments => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_allotments.csv") do |row|

      begin
        @unit = Protocol::Alloment.create({
          created_at:         row[2],
          description:        row[3]
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  
  end


  desc "Migração assessments"
  task :assessments => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_assessments.csv") do |row|

      begin
        @assessment = Protocol::Assessment.create({
          number:                   row[2],
          year:                     row[3],
          prefex:                   row[4],
          document_number:          row[5],
          requesting_unit:          row[6],
          external_agency:          row[7],
          recipient:                row[8],
          address:                  row[9],
          cpf:                      row[10], 
          cnpj:                     row[11], 
          sign_by:                  row[12],
          observation:              row[13],
          document_type_id:         row[14],
          subject_id:               row[15],
          description_subject:      row[16],
          created_at:               row[17],
          staff_id:                 row[18],
          sector_id:                row[23]
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  end




  desc "Migração assessments"
  task :assessments => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_assessments.csv") do |row|

      begin
        @assessment = Protocol::Assessment.create({
          number:                   row[2],
          year:                     row[3],
          prefex:                   row[4],
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  end

end