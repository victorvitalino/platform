require_dependency 'finance/application_controller'

require 'barby'
require 'barby/barcode/qr_code'
require 'barby/barcode/code_25_interleaved'
require 'barby/outputter/png_outputter'
require 'codhab_barcode'

module Finance
  class BankSlipsController < ApplicationController
    
    def index
      if params[:start].present?
        @bank_slips = BankSlip.search(params)
      else
        @bank_slips = BankSlip.where(created_at:Date.today.beginning_of_month..Date.today.end_of_month).order('created_at DESC')
      end
    end

    def new 
        @bank_slip = BankSlip.new
    end

    def show
        @bank_slip = BankSlip.find(params[:id])
    end

    def create
        @bank_slip = BankSlip.new(set_params)

        if @bank_slip.save
            redirect_to @bank_slip
        else
            render action: 'new'
        end
    end

    def generate
        @bank_slip = BankSlip.find(params[:bank_slip_id])
        @barcode = BankSlip.barcode(@bank_slip)
   
        qrcode  = Barby::QrCode.new(@bank_slip.barcode)
        barcode = Barby::Code25Interleaved.new(@bank_slip.barcode)
        
        @qr_code  = "#{@bank_slip.deadline.strftime('%Y%m%d')}_barcode_#{@bank_slip.cpf}#{@bank_slip.id}"
        @bar_code = "#{@bank_slip.deadline.strftime('%Y%m%d')}_qrcode_#{@bank_slip.cpf}#{@bank_slip.id}"
            
        File.open("public/bank_slips/#{@bar_code}.png", 'w'){|f| f.write barcode.to_png(height: 50, margin: 0) }
        File.open("public/bank_slips/#{@qr_code}.png", 'w'){|f| f.write qrcode.to_png(xdim: 4, width: 10, height: 40, margin: 1) }
        
        render layout: 'layouts/finance/show_bank_slip'
    end

    private

    def set_params
        params.require(:bank_slip).permit(:type_slip_id, :name, :cpf, :value, :observation, :deadline)
    end

  end
end