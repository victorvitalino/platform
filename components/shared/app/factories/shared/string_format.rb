module Shared
  module StringFormat

    def percent_string_of(n)
      if n == 0
        "0 %"
      else
        "#{(self.to_f / n.to_f * 100.0).round(2)} %"
      end
    end

    def format_cpf
      @cpf  = self
      @cpf  =~ /(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{2})/
      @cpf  = "#{$1}.#{$2}.#{$3}-#{$4}"
    end

    def unformat_cpf
      self.to_s.gsub('-','').gsub('.','')
    end

    def format_obfuscator_cpf
      @cpf  = self
      @cpf  =~ /(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{2})/
      @cpf  = "***.***.#{$3}-#{$4}"
    end

    def format_cnpj
      # => 00.000.000/0000-00

      @cpf  = self
      @cpf  =~ /(\d{2})\.?(\d{3})\.?(\d{3})\.?(\d{4})-?(\d{2})/
      @cpf  = "#{$1}.#{$2}.#{$3}/#{$4}-#{$5}"
    end

    def unformat_cnpj
      self.gsub('.','').gsub('-','').gsub('/','')
    end


    def underline_array
     self.split('_')
    end


  end
end
