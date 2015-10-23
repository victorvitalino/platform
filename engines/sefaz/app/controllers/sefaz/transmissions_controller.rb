require_dependency 'sefaz/application_controller'

require "signer"
require 'nokogiri'

module Sefaz
  class TransmissionsController < ApplicationController
    before_action :set_transmission, only: [:show]

    def index
      @transmissions = Transmission.all.order('created_at DESC')
    end

    def new
      @transmission = Transmission.new
    end

    def show
     
    end

    def create
      @transmission = Transmission.new(set_params)

      if @transmission.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end

    end


    def sign_document

      @transmission = Transmission.find(params[:transmission_id])

      @xml = <<-eos
      <?xml version="1.0" encoding="utf-8"?>
        <ArrayOfImovelConstruido xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      eos

      @transmission.transmission_candidates.each do |candidate|
        @xml += <<-eos  
          <imovelConstruido Id="51879">
            <nomeTransmitente xmlns="http://tempuri.org/">#{candidate.organization}</nomeTransmitente>
            <cnpj xmlns="http://tempuri.org/">#{candidate.cnpj}</cnpj>
            <nomeAdquirente xmlns="http://tempuri.org/">#{candidate.name}</nomeAdquirente>
            <cpfAdquirente xmlns="http://tempuri.org/">#{candidate.cnpj}</cpfAdquirente>
            <enderecoCompleto xmlns="http://tempuri.org/">#{candidate.address}</enderecoCompleto>
            <inscricaoImovel xmlns="http://tempuri.org/">#{candidate.unit_code}</inscricaoImovel>
            <tipoTransacao xmlns="http://tempuri.org/">#{(candidate.exemption_type == 'ITBI') ? 1 : 2}</tipoTransacao>
            <valorPactuado xmlns="http://tempuri.org/">#{candidate.unit_value}</valorPactuado>
          </imovelConstruido>  
        eos
      end

      @xml += <<-eos
        </ArrayOfImovelConstruido>
      eos

      signer = Signer.new(Nokogiri::XML(@xml).to_xml)
      signer.cert = OpenSSL::X509::Certificate.new(File.read("public/cert/20151016-cert.pem"))
      signer.private_key = OpenSSL::PKey::RSA.new(File.read("public/cert/20151016-pkey.pem"), "261018")

      signer.document.xpath("//u:Timestamp", { "u" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" }).each do |node|
        signer.digest!(node)
      end

      signer.document.xpath("//a:To", { "a" => "http://www.w3.org/2005/08/addressing" }).each do |node|
        signer.digest!(node)
      end

      signer.sign!(:security_token => true)

      @xml = signer.to_xml
    end

    private

    def set_params
      params.require(:transmission).permit(:csv)
    end

    def set_transmission
      @transmission = Transmission.find(params[:id])
    end
  end
end