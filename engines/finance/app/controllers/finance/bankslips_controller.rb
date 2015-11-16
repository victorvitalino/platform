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
        
        @bankslip = Finance::Bankslip.new({
                        type_guide_id: @payment_guide.type_guide_id,
                        deadline: @payment_guide.deadline,
                        name: @payment_guide.name,
                        cpf: @payment_guide.cpf,
                        observation: @payment_guide.observation,
                        model_guide_id: @payment_guide.model_guide_id
                    })
        

      render layout: 'layouts/finance/show_payment', template: 'layouts/finance/templates/bankslip'
    end

  end
end