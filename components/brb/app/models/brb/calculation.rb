module Brb
  module Calculation
    
    attr_accessor :digit_module_10, :digit_module_11

    def convenant_digit
      total_int   = 0
      multiplier  = 1
     
      self.each_char do |char|
        total_int   += ((multiplier % 2) != 0) ? sum_integer(char.to_i * 2) : char.to_i
        multiplier  +=  1
      end
    
      identifier = ((total_int % 10) != 0) ? 10 - (total_int % 10) : 0
    end


    def module_10(options = {})
      self.is_number?

      total_int   = 0
      multiplier  = options[:multiplier] ||= [2,1]
      index       = 0

      self.split(//).each do |char|
        value      = char.to_i * multiplier[index] 
        total_int += (value > 9) ? value  - 9 : value
        index      = (index == multiplier.count - 1) ? 0 : index + 1
      end

      result = total_int % 10
      result = (result > 0) ? 10 - result : 0


    end
    


    def module_11
      self.is_number?

      total_int   = 0
      multiplier  = [7,6,5,4,3,2] 
      index       = 0

      self.split(//).each do |char|
        total_int += char.to_i * multiplier[index]
        index      = (index == multiplier.count - 1) ? 0 : index + 1
      end

      result = total_int % 11 
    end

    def module_11_digit
      @number = self.module_11
      (@number == 0 || @number == 1 || @number == 10) ? 1 : (11 - @number)
    end

    def calculate!
      # calculation module 10 and module 11 
      @digit_module_10 = self.module_10
      @digit_module_11 = "#{self}#{@digit_module_10}".to_s.module_11

      if @digit_module_11 == 0 
        @digit_module_11 = 0
      elsif @digit_module_11 > 1 
        @digit_module_11 = 11 - digit_module_11
      else 
        @digit_module_10 = (@digit_module_10 + 1) == 10 ? 0 : @digit_module_10 + 1
        @digit_module_11 = "#{self}#{@digit_module_10}".to_s.module_11
      end

      {digit_one: @digit_module_10, digit_two: @digit_module_11}
       
    end


    def is_number?
      self if Float(self) rescue fail ArgumentError, 'Invalid number'
    end


    def sum_integer(num)
      value = 0
      num.to_s.each_char { |char| value += char.to_i }
      value
    end
  end
end

