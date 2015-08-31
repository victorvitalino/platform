require_dependency 'finance/application_controller'

require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'
require 'codhab_billing'

module Finance
  class BankslipsController < ApplicationController
  
    def generate

        @payment_guide = PaymentGuide.find(params[:payment_guide_id])

        @value = '%.2f' % @payment_guide.value

        @barcode = CodhabBilling::Bills::BankSlip.new({
                                        value: @value.to_s.gsub('.',''),
                                        deadline: @payment_guide.deadline,
                                        sequential: @payment_guide.id
                                      })

        
        
        barcode = Barby::Code128.new(@barcode.barcode_without_format)
        @bar_code = "#{@payment_guide.created_at.strftime('%Y%m%d')}_barcode_#{@payment_guide.cpf}#{@payment_guide.id}"
        File.open("public/barcodes/#{@bar_code}.png", 'w'){|f| f.write barcode.to_png(xdim: 1,height: 50) }
        
        render layout: 'layouts/finance/show_payment', template: 'layouts/finance/templates/bankslip'
    end

  end
end