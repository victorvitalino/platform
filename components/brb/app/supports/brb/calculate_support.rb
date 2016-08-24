module Brb
  class CalculateSupport
      
    attr_accessor :base_key
    attr_accessor :digit_module_10, :digit_module_11

    def initialize(options = {})
      @base_key = options[:base_key] ||= nil

      raise ArgumentError, "base key not defined" if options[:base_key].nil? 
    end

    def calc_module_10
      multiplier = [2,1]
      each_index = 0
      total_int  = 0

      @base_key.split(//).each do |char|
        current_int  = char.to_i * multiplier[each_index]
        total_int   += (current_int > 9) ? current_int - 9 : current_int
        each_index   = (each_index == 1) ? 0 : each_index + 1 
      end

      total = total_int % 10
      
      @digit_module_10 = (total == 0) ? 0 : 10 - total
    end

    def calc_module_11
      calc_module_10
      base_key_module_10 = "#{@base_key}#{@digit_module_10}"

      multiplier = [7,6,5,4,3,2,1]
      each_index = 0
      total_int  = 0

      base_key_module_10.split('//').each do |char|
        total_int  += char.to_i * multiplier[each_index]
        each_index  = (each_index == (multiplier.count - 1)) ? 0 : each_index + 1
      end

      total = total_int % 11
    end


  end
end