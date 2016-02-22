module Brb
  class Return
    include ActiveModel::Model

    attr_accessor :file

    validates :file, presence: true

    def process!

      File.open(self.file.tempfile).each_with_index do |line, index|
        if index != 0 
              
            date = line[299..306]
            date = Date.parse("#{date[0..1]}/#{date[2..3]}/#{date[4..8]}") rescue nil
            code = line[108..109]

            @invoice = Invoice.find_by_our_number(line[70..81]) rescue nil 

            if @invoice.present? && %w(05 06 15 16).include?(code) && date.present?
              @invoice.payment = date
              @invoice.status = 1
              @invoice.bank_return = line
              @invoice.save
            end
        end
      end
    end
  end
end