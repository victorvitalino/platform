require 'csv'

namespace :brb do
  desc "migração csv"

  task :barcode => :environment do 
    
    @index = 1000

    20.times do 
      @barcode_service = Brb::CreateBarcodeService.new({
          due: '2016-08-28',
          value: 300,
          sequential: @index,
          bank_wallet: 1,
          bank_agency: 208,
          bank_account: '0149304'
      })

      puts @barcode_service.barcode_with_digit

      @index += 1
    end

  end

  task :remessa => :environment do
    Dir.foreach("lib/files/brb") do |file|
      unless File.directory?(file)

        File.open("lib/files/brb/#{file}").each_with_index do |line, index|
        
        if index != 0 
            block_1 = line[0..17]
            block_2 = line[20..37]
            block_3 = line[70..92]
            block_4 = line[107..124]
            block_5 = line[128..140]
            block_6 = line[148..400]
            
            puts "#{block_4[1..2]} - #{block_3[1..6]}" 

        else
          puts file
        end
      end
      end
    end

  end
end
