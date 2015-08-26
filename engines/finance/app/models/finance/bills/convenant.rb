require 'codhab_billing'

module Finance
  module Bills
    class Convenant
      include ActiveModel::Model


      attr_accessor :value, :deadline, :days_deadline, :sequential
      attr_accessor :barcode, :barcode_plain, :barcode_formated
 
      def intialize(options = {})
         @barcode = CodhabBilling::Bills::Convenant.new(options)
      end
    end
  end
end