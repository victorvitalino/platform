module Finance
  module Bills
    class Bankslip
      include ActiveModel::Model

      attr_accessor :value, :deadline, :days_deadline, :sequential
      attr_accessor :barcode, :barcode_plain, :barcode_formated

      def initialize(options = {})
        #argumentos [valor, data de vencimento, quantidade de dias para vencer, sequencial]

        @barcode = CodhabBilling::Bills::BankSlip.new(options)
      end

    end
  end
end