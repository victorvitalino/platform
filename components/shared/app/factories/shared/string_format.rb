module Shared
  module StringFormat
    
    def format_cpf
      @cpf  = self
      @cpf  =~ /(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{2})/
      @cpf  = "#{$1}.#{$2}.#{$3}-#{$4}"
    end
  end
end

