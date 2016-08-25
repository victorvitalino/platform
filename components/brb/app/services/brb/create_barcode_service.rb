module Brb
  class CreateBarcodeService
    
    attr_accessor :bank, :bank_agency, :bank_account, :bank_wallet

    attr_accessor :sequential, :due, :value, :coin

    attr_accessor :brb_key, :key_digits

    # => data correction based in bussiness logic BRB
    DATE_CORRECTION = "03/07/2000" 

    def initialize(args = {})
      self.bank         = args[:bank]         ||= '070'
      self.bank_agency  = args[:bank_agency]  ||= '058'
      self.bank_account = args[:bank_account] ||= '6002006'
      self.bank_wallet  = args[:bank_wallet]  ||= '1'

      self.due          = args[:due]          ||= nil
      self.coin         = args[:coin]         ||= '9'
      self.value        = args[:value]        ||= 1
      self.sequential   = args[:sequential]   ||= '1'

      self.key_digits   = brb_keys
    end


    # => formaters variables
    def sequential=(value)
      @sequential = "#{'%06d' % value.to_i}"
    end


    def due=(value)
      # => 14/03/2013 = 5637
      date = Date.parse(value) rescue nil

      if date.nil? 
        @due = '0000'
      else 
        @due = (date - Date.parse(DATE_CORRECTION)).to_i + 1000
      end

    end

    def value=(value)
      value   = sprintf('%.2f', value)
      @value  = "#{'%010d' % value.to_s.gsub('.','').to_i}"
    end

    def agency_and_benefict_code
      "000#{@bank_agency}#{@bank_account}"
    end


    # => brb key with and without digits
    # => cap 1 - manual brb
    def brb_keys
      Brb::CalculateSupport.new(brb_key_without_digits).calc!
    end

    def brb_key_without_digits
      "#{agency_and_benefict_code}#{our_number_without_digits}"
    end
   
    def brb_key_with_digits 
      "#{agency_and_benefict_code}#{our_number_without_digits}#{@key_digits[:digit_one]}#{@key_digits[:digit_two]}"
    end



    # => our number with and without digits
    def our_number_without_digits
      "#{@bank_wallet}#{@sequential}#{@bank}"
    end

    def our_number_with_digits
      "#{@bank_wallet}#{@sequential}#{@bank}#{@key_digits[:digit_one]}#{@key_digits[:digit_two]}"
    end


    # => line digitable line
    # => calculate groups

    def group_one_without_digit
      "#{@bank}#{@coin}#{brb_key_with_digits[0..4]}"
    end

    def group_one_with_digit
      digit = Brb::CalculateSupport.new(group_one_without_digit).calc_module_10
      "#{group_one_without_digit}#{digit}"
    end

    def group_two_without_digit
      "#{brb_key_with_digits[5..14]}"
    end

    def group_two_with_digit
      digit = Brb::CalculateSupport.new(group_two_without_digit).calc_module_10
      "#{group_two_without_digit}#{digit}"
    end


    def group_three_without_digit
      "#{brb_key_with_digits[15..24]}"
    end

    def group_three_with_digit
      digit = Brb::CalculateSupport.new(group_three_without_digit).calc_module_10
      "#{group_three_without_digit}#{digit}"
    end


    # => calculate digit about 42 position of barcode

    def barcode_without_digit
      "#{@bank}#{@coin}#{@due}#{@value}#{brb_key_with_digits}"
    end

    def barcode_digit
      Brb::CalculateSupport.new(barcode_without_digit).calc_module_11_barcode
    end

    def barcode_with_digit
      "#{group_one_with_digit}#{group_two_with_digit}" \
      "#{group_three_with_digit}#{barcode_digit}" \
      "#{@due}#{@value}"
    end

  end
end