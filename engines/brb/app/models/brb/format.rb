module Brb
  module Format
    def date_format!
      if self.zero?
        self
      else
        Date.parse(self).strftime('%d/%m/%Y') rescue fail ArgumentError, 'Invalid date to deadline, format (d/m/Y)'
      end
    end
    

    def convenant_date_format!
     begin 
       DateTime.parse(self).strftime('%Y%m%d')
     rescue 
       fail ArgumentError, 'Data inválida, o valor a ser enviado deve ser String no padrão dd/mm/yyyy'
     end
    end

    def currency_convenant_format!
      value = '%.2f' % self
      value = self.to_s.gsub('.','')
      
      '%011d' % value.to_i
    end

    def zero?
      (self.to_s == "0")
    end    
  end
end

String.class_eval { include CodhabBilling::Format }