module Sefaz
  class Exemption < ActiveRecord::Base
    belongs_to :send_status
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :staff_send, class_name: "Person::Staff"

    require 'csv'

    attr_accessor :file

     def import(file)
      byebug
       CSV.foreach(file.path, headers: true) do |row|
         exemption_hash = row.to_hash # exclude the price field
         exemption = Exemption.where(id: exemption_hash["id"])

         if exemption.count == 1
           exemption.first.update_attributes(exemption_hash)
         else
           Exemption.create!(exemption_hash)
         end # end if !product.nil?
       end # end CSV.foreach
     end # end self.import(file)




  end
end
