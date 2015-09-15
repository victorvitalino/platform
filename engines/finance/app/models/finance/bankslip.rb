require 'codhab_billing'

module Finance
  class Bankslip 
    include ActiveModel::Model


      attr_accessor :type_guide_id, :deadline, :name, :cpf, :value, :observation, :model_guide, :sequential, :barcode
      attr_accessor :guide, :payment_guide

      def initialize(options = {})
        @type_guide_id  = options[:type_guide_id]
        @deadline       = options[:deadline]
        @name           = options[:type_guide_id]
        @cpf            = options[:type_guide_id]
        @observation    = options[:type_guide_id]
        @model_guide_id = options[:type_guide_id]
      end


      def set_guide
        @guide = Finance::TypeGuide.find(@type_guide_id) ||= errors.add(:type_guide_id, 'tipo de cobrança inválida')
      end

      def set_payment_guide
        @payment_guide  = Finance::PaymentGuide.new(
            type_guide_id: @guide.id,
            deadline: @deadline - 5.days,
            name: @name,
            cpf: @cpf,
            value: @value,
            observation: @observation,
            model_guide: @model_guide_id
        )
      end

      def generate
        if @payment_guide.save
          @value = '%.2f' % @payment_guide.value
          @barcode = CodhabBilling::Bills::BankSlip.new(
              {
                value: @value.to_s.gsub('.',''),
                deadline: @payment_guide.deadline,
                sequential: @payment_guide.id
              }
          )

          @payment_guide.update(barcode: @barcode.barcode_without_format)
          barcode = Barby::Code128.new(@barcode.barcode_without_format)
          @bar_code = "#{@payment_guide.created_at.strftime('%Y%m%d')}_barcode_#{@payment_guide.cpf}#{@payment_guide.id}"
          File.open("public/barcodes/#{@bar_code}.png", 'w'){|f| f.write barcode.to_png(xdim: 1,height: 50) }
        else
          false
        end

      end
  end
end