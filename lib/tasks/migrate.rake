namespace :cities do
  desc "migração de cidades"
  task :migrate => :environment do
    BRPopulate.populate
  end

  desc 'migração de endereços parcial'
  task :migrate_address => :environment do 
    CSV.foreach("lib/files/endereco_parcial.csv", :col_sep => ";") do |row|
      @unit = Address::Unit.new
      @unit.city_id = row[0]
      @unit.block   = row[2] 
      @unit.group   = row[4]
      @unit.unit    = row[5]
      @unit.program = row[16]
      @unit.complete_address = row[9]
      @unit.save
    end
  end
end