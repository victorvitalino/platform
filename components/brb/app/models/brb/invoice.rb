module Brb
  class Invoice < ActiveRecord::Base
    belongs_to :category
    belongs_to :state, class_name: "Address::State"

    enum status: ['não pago', 'pagamento realizado']

    validates :due, :cpf, :name, :address, :state, :city, :cep, presence: true
    validates_date :due, after: :due_validate , on: :create
    
    after_create :generate_invoice!

    private

    def due_validate
      Date.today - 1.day
    end

    def generate_invoice!
      barcode = Barcode.new({
        due: self.due,
        value: self.category.default_value,
        sequential: self.id,
        bank_wallet: 1,
        bank_agency: 208,
        bank_account: '0149304'
      })
=begin
      @bank_wallet  = options[:bank_wallet]     ||= '1'
      @sequential   = options[:sequential]      ||= '1'
      @bank         = options[:bank]            ||= '070'
      @bank_agency  = options[:bank_agency]     ||= '058'
      @bank_account = options[:bank_account]    ||= '6002006'

      @due          = options[:due]             ||= '0'
      @coin         = options[:coin]            ||= '9'
      @value        = options[:value]           ||= 100
=end
      self.update({
        barcode: barcode.barcode_without_format,
        barcode_with_format: barcode.barcode_with_format,
        value: self.category.default_value,
        our_number: barcode.our_number,
        document_number: barcode.formated_sequential
      })
    end
  end
end
