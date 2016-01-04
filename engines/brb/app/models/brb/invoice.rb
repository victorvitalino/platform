module Brb
  class Invoice < ActiveRecord::Base
    belongs_to :category
    belongs_to :city,  class_name: "Address::City"
    belongs_to :state, class_name: "Address::State"

    enum status: ['não pago', 'pagamento realizado']

    validates :due, :cpf, :name, :address, :state, :city, :cep, presence: true
    validates_date :due, after: Date.today
    
    after_create :generate_invoice!

    private

    def generate_invoice!
      barcode = Barcode.new({
        deadline: self.due,
        value: self.category.default_value,
        sequential: self.id
      })

      self.update({
        barcode: barcode.barcode_without_format,
        barcode_with_format: barcode.barcode_with_format,
        value: self.category.default_value,
        wallet: barcode.wallet,
        sequential_without_digit: barcode.sequential_without_digit,
        sequential_digit_one: barcode.sequential_digit_one,
        sequential_digit_two: barcode.sequential_digit_two
      })
    end
  end
end
