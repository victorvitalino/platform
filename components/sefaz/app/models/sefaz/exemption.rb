module Sefaz
  class Exemption < ActiveRecord::Base
    belongs_to :send_status
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :staff_send, class_name: "Person::Staff"

    attr_accessor :file

    def self.import(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        exemption = find_by_id(row["id"]) || new
        exemption.attributes = row.to_hash.slice(*accessible_attributes)
        exemption.save!
      end
    end


    def self.open_spreadsheet(file)
      
      case File.extname(file.original_filename)
        when '.csv' then Csv.new(file.path, nil, :ignore)
        when '.xls' then Excel.new(file.path, nil, :ignore)
        when '.xlsx' then Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
      end
    end

  end
end
