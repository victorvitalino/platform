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

    #variaveis de configuração
    attr_accessor :coin 

    DATE_CORRECTION = "03/07/2000" #Essa data é para criação do fator vencimento, capitulo 7

    def initialize(options = {})
      #valores padrão do manual
      @bank_wallet  = options[:bank_wallet]     ||= '1'
      @sequential   = options[:sequential]      ||= '1'
      @bank         = options[:bank]            ||= '070'
      @bank_agency  = options[:bank_agency]     ||= '058'
      @bank_account = options[:bank_account]    ||= '6002006'

      @due          = options[:due]             ||= '0'
      @coin         = options[:coin]            ||= '9'
      @value        = options[:value]           ||= 100
    end


    #agência / código do beneficário
    def agency_and_benefict_code_formated
      "000 - #{@bank_agency} - #{@bank_account}"
    end

    def agency_and_benefict_code
      "000#{@bank_agency}#{@bank_account}"
    end

    # nosso número
    def our_number
      #carteira direta com registro NOSSO NUMERO = 2
      set_key_digits

      "#{@bank_wallet}#{self.formated_sequential}#{@bank}#{@key_digit_one}#{@key_digit_two}"
    end

    def document_number
      "#{self.formated_sequential}"
    end

    def key
      "#{agency_and_benefict_code}#{our_number}"
    end

    def barcode_without_digit
      "#{@bank}#{@coin}#{self.due_factor}#{self.value_factor}#{self.key}"
    end

    def barcode_with_digit
      "#{@bank}#{@coin}#{self.barcode_digit}#{self.due_factor}#{self.value_factor}#{self.key}"
    end

    def barcode_without_format
        "#{self.group_one}#{self.group_one.to_s.module_10}" \
        "#{self.group_two}#{self.group_two.to_s.module_10}" \
        "#{self.group_three}#{self.group_three.to_s.module_10}" \
        "#{self.barcode_digit}#{self.due_factor}" \
        "#{self.value_factor}"
    end

    def barcode_with_format
      "#{self.barcode_without_format[0..4]}.#{self.barcode_without_format[5..9]} " \
      "#{self.barcode_without_format[10..14]}.#{self.barcode_without_format[15..20]} " \
      "#{self.barcode_without_format[21..25]}.#{self.barcode_without_format[26..31]} " \
      "#{self.barcode_without_format[32]} " \
      "#{self.barcode_without_format[33..46]}"
    end

    def group_one
      "#{@bank}#{@coin}#{self.key[0..4]}"
    end

    def group_two
      "#{self.key[5..14]}"
    end

    def group_three
      "#{self.key[15..25]}"
    end

    def group_four
      "#{@due_factor}#{@value_factor}"
    end

    #formating variables
    def formated_sequential
      "#{'%06d' % @sequential.to_i}"
    end

    private

    def set_key_digits
      digit = "#{self.agency_and_benefict_code}#{@bank_wallet}#{self.formated_sequential}#{@bank}".calculate!

      @key_digit_one = digit[:digit_one]
      @key_digit_two = digit[:digit_two]
    end


    protected


    def barcode_digit
      barcode = self.barcode_without_digit
      barcode.module_11({multiplier: [2,3,4,5,6,7,8,9]})
    end

    def due_factor
      if @due.class == Date
        (@due - Date.parse(DATE_CORRECTION)).to_i + 1000
      else
        "0000"
      end
    end

    def value_factor
      value = sprintf('%.2f', @value)
      "#{'%010d' % value.to_s.gsub('.','').to_i}" 
    end
  end
end