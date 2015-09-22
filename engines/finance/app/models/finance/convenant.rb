require 'barby'
require 'barby/barcode/code_25_interleaved'
require 'barby/outputter/png_outputter'
require 'codhab_billing'

module Finance
  class Convenant
  
    include ActiveModel::Model 
    
    attr_accessor :payment_guide, :barcode, :barcode_image, :barcode_image_path

    def initialize(options = {})
      raise ArgumentError.new("dados incompletos [code, value, deadline, cpf, name, observation]") unless options.present? 

      set_code_guide(options[:code])

      set_payment_guide({
        type_guide_id: @type_guide.id,
        value: @type_guide.value,
        deadline: options[:deadline],
        cpf: options[:cpf],
        name: options[:name],
        observation: options[:observation],
        model_guide: 0
      })
    end
  
    private

    def set_code_guide(code)
      @type_guide = Finance::TypeGuide.find_by_code(code) rescue ArgumentError.new('code não encontrado') 
    end

    def set_payment_guide(options = {})
      @payment_guide = Finance::PaymentGuide.new(options)
      if @payment_guide.save
        set_barcode
        @payment_guide.update(barcode: @barcode.barcode_with_all_digit)
      end
    end
  
    def set_barcode
      @barcode =  CodhabBilling::Bills::Convenant.new({
        value: @payment_guide.value,
        deadline: @payment_guide.deadline,
        sequential: @payment_guide.id
      });

      set_barcode_image
    end
  
    def set_barcode_image
      @barcode_image      = Barby::Code25Interleaved.new(@barcode.barcode_with_all_digit)
      @barcode_image_path = "#{@payment_guide.created_at.strftime('%Y%m%d')}_barcode_#{@payment_guide.cpf}#{@payment_guide.id}"
      File.open("public/barcodes/#{@barcode_image_path }.png", 'w'){|f| f.write @barcode_image.to_png(height: 50) }
    end
  end
end