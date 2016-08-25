module Brb
  class CalculateSupport
      
    attr_accessor :base_key
    attr_accessor :digit_module_10, :digit_module_11

    def initialize(value = nil)
      raise ArgumentError, "base key not defined" if value.nil? 
      
      @base_key = value
    end

    def calc!
      calc_module_10
      calc_module_11

      {digit_one: @digit_module_10, digit_two: @digit_module_11}
    end

    # => Brb tutorial is a bullshit, go to wikipedia
    # => https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador#M.C3.B3dulo_10

    def calc_module_10
      multiplier = [2,1]
      each_index = 0
      total_int  = 0

      @base_key.split(//).reverse!.each do |char|
        current_int  = char.to_i * multiplier[each_index]
        total_int   += (current_int > 9) ? current_int - 9 : current_int
        each_index   = (each_index == 1) ? 0 : each_index + 1 
      end

      total = total_int % 10
      
      @digit_module_10 = (total == 0) ? 0 : 10 - total
    end


    def calc_module_11
      base_key_module_10 = "#{@base_key}#{calc_module_10}"

      multiplier = [2,3,4,5,6,7]
      each_index = 0
      total_int  = 0

      base_key_module_10.split(//).reverse!.each do |char|
        total_int  += char.to_i * multiplier[each_index]
        each_index  = (each_index == (multiplier.count - 1)) ? 0 : each_index + 1
      end

      total = total_int % 11

      case total
      when 0
        @digit_module_11 = 0
      when 1
        pre_digit         = @digit_module_10 + 1
        @digit_module_10  = pre_digit == 10 ? 0 : pre_digit
        @digit_module_11  = total

        #recalcular?
      else
        @digit_module_11  = 11 - total
      end

      @digit_module_11
    end


    def calc_module_11_barcode

      multiplier = [2,3,4,5,6,7,8,9]
      each_index = 0
      total_int  = 0

      base_key.split(//).reverse!.each do |char|
        total_int  += char.to_i * multiplier[each_index]
        each_index  = (each_index == (multiplier.count - 1)) ? 0 : each_index + 1
      end

      total = total_int % 11
      
      if total == 0 || total == 1 || total == 10
        total = 1
      else
        total = 11 - total
      end 

      total
    end
  end
end