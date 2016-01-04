require_dependency 'brb/application_controller'

require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

module Brb
  class InvoicesController < ApplicationController

    def index
      @invoices = Invoice.all.order('created_at DESC')
    end

    def show

      @invoice = Invoice.find(params[:id])
      
      barcode = Barby::Code128.new(@invoice.barcode)
      File.open("public/barcodes/#{barcode}.png", 'w') { |f| f.write barcode.to_png(xdim: 1,height: 50) }
      
      render layout: 'brb/invoice'
    end

    def new
      @invoice = Invoice.new
    end

    def create
      @invoice = Invoice.new(set_params)
      @invoice.remittance = false
      if @invoice.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:invoice).permit(:category_id, :due, :cpf, :name, :address,
                                      :city_id, :state_id, :cep, :message)
    end
  end
end