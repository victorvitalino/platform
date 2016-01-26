module Brb
  class Return
    include ActiveModel::Model

    attr_accessor :file

    validates :file, presence: true

    def process!

      File.open(self.file.tempfile).each_with_index do |line, index|
        if index != 0 
            date = line[299..306]
            if date.to_i != 0
              @invoice = Invoice.find(line[92..104].to_i)

              @invoice.payment = Date.parse("#{date[0..1]}-#{date[2..3]}-#{date[4..8]}")
              @invoice.status = 1
              @invoice.bank_return = line
              
              @invoice.save!
            end
        end
      end
    end
  end
end