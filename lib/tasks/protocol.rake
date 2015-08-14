namespace :protocol do

  desc "Migração de assuntos"
  task :subjects => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_subjects.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::Subject.create({
          name: row[1].to_s.downcase.strip,
          description: row[2].to_s.downcase.strip,
          status: true
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  end


  desc "Migração de tipos"
  task :document_types => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_document_types.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::DocumentType.create({
          name: row[1].to_s.downcase.strip,
          description: row[2].to_s.downcase.strip,
          status:  true
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  end


  desc "Migração de conduct"
  task :conducts => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_conducts_1.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::Conduct.create({
          created_at: row[2],
          staff_id: row[4],
          sector_id:  row[5],
          allotment_id:   row[6],
          assessment_id: row[7],
          conduct_type: 1
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end

    CSV.foreach("lib/files/migrate/current/protocol_conducts_2.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::Conduct.create({
          created_at: row[1],
          sector_id:  row[3],
          staff_id: row[4],
          assessment_id: row[6],
          conduct_type: 4
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end 

    CSV.foreach("lib/files/migrate/current/protocol_conducts_3.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::Conduct.create({
          created_at: row[1],
          sector_id:  row[3],
          staff_id: row[4],
          allotment_id:   row[5],
          assessment_id: row[6],
          conduct_type: 4
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  end


  desc "Migração de localizações"
  task :locations => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_locations.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::Location.create({
          created_at: row[2],
          shelf: row[3],
          pile:  row[4],
          box:   row[5],
          observation: row[6],
          sector_id: row[8],
          assessment_id: row[9],
          staff_id: row[10]
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end
  end


  desc "Migração de lote"
  task :alloments => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_allotments.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::Allotment.create({
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


  desc "Migração de anexos e apensos"
  task :attchs => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_attachments_1.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @attachments = Protocol::AttachDocument.create({
          document_father_id:      row[0],
          created_at:              row[3],
          document_child_id:       row[4],
          attach_type: 0
        })
        

        puts @index
        @index = @index + 1

      rescue Exception => e
        puts "ERROR - #{e}"
      end
      
    end

    CSV.foreach("lib/files/migrate/current/protocol_attachments_2.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin
        @unit = Protocol::AttachDocument.create({
          document_father_id:      row[0],
          created_at:              row[2],
          document_child_id:       row[4],
          attach_type: 1
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
   
    CSV.foreach("lib/files/migrate/current/protocol_assessments.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

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

  desc "Migração de conducts"
  task :conducts => :environment do
    @index = 0
   
    CSV.foreach("lib/files/migrate/current/protocol_conducts_1.csv", encoding: "ISO-8859-9", col_sep: ";") do |row|

      begin

        @unit = Protocol::Allotment.create({
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




end