require_dependency 'finance/application_controller'

require 'barby'
require 'barby/barcode/code_25_interleaved'
require 'barby/outputter/png_outputter'
require 'codhab_billing'

module Finance
  class ConvenantsController < ApplicationController
    
    def generate

      @payment_guide = PaymentGuide.find(params[:payment_guide_id])
      @barcode = CodhabBilling::Bills::Convenant.new({
                                        value: @payment_guide.value,
                                        deadline: @payment_guide.deadline,
                                        sequential: @payment_guide.id
                                      })
      barcode = Barby::Code25Interleaved.new(@barcode.barcode_with_all_digit)
      @bar_code = "#{@payment_guide.created_at.strftime('%Y%m%d')}_barcode_#{@payment_guide.cpf}#{@payment_guide.id}"
      File.open("public/barcodes/#{@bar_code}.png", 'w'){|f| f.write barcode.to_png(height: 50) }
      
      render layout: 'layouts/finance/show_payment', template: 'layouts/finance/templates/convenant'
    end
    
  end
end