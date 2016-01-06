module Brb
  class Barcode
    include ActiveModel::Model
    

    # capitulo 1 - composição da chave

    #váriveis bancárias
    attr_accessor :bank, :bank_agency, :bank_account, :bank_wallet

    #variaveis de execução
    attr_accessor :sequential, :due, :value

    #variaveis de calculo
    attr_accessor :key_digit_one, :key_digit_two 


    def initialize(options = {})
      #valores padrão do manual
      @bank_wallet  = options[:bank_wallet]     ||= '1'
      @sequential   = options[:sequential]      ||= '1'
      @bank         = options[:bank]            ||= '070'
      @bank_agency  = options[:bank_agency]     ||= '058'
      @bank_account = options[:bank_account]    ||= '6002006'
    end


    #agência / código do beneficário
    def agency_and_benefict_code
      "000 - #{@bank_agency} - #{@bank_account}"
    end

    # nosso número
    def our_number
      #carteira direta com registro NOSSO NUMERO = 2
      set_key_digits

      "#{@bank_wallet}#{self.formated_sequential}#{@bank}#{@key_digit_one}#{@key_digit_two}"
    end


    private

    def set_key_digits
      digit = "#{@bank_wallet}#{self.formated_sequential}#{@bank}".calculate!

      @key_digit_one = digit[:digit_one]
      @key_digit_two = digit[:digit_two]
    end

    protected

    #formating variables
    def formated_sequential
      "#{'%06d' % @sequential.to_i}"
    end
  end
end