require "i18n"

module Brb
  class Remittance < ActiveRecord::Base

    def generate
      invoices = Invoice.where(remittance: false)
      text   = Array.new
     
      header = " " * 39 
      header[1..3] = "DCB"
      header[4..6] = "001"
      header[7..9] = "075"
      header[10..12] = "208"
      header[13..19] = "0149304"
      header[20..27] = "AAAAMMDD"
      header[28..33] = "HHMMSS"
      header[34..39] = (invoices.count + 1).to_s.ljust(6, ' ')
      header.slice!(0)
      
     
       invoices.each do |i|
        white_space = "-"

        line             = " " * 400
        
        line[1..2]       = "01" 
        line[3..5]       = "208"
        line[6..12]      = "0149304"
        line[13..26]     = i.cpf.to_s.ljust(14)
        line[27..61]     = I18n.transliterate(i.name.mb_chars.upcase.ljust(35))  
        line[62..96]     = I18n.transliterate(i.address.mb_chars.ljust(35)).upcase  
        line[97..111]    = I18n.transliterate(i.city.name.mb_chars.ljust(15)).upcase 
        line[112..113]   = i.state.acronym.mb_chars.upcase.ljust(2)  
        line[114..121]   = i.cep.ljust(8)     
        line[122]       = "1"
        line[123..135]  = "#{i.wallet}#{i.sequential_without_digit}".ljust(13)  
        line[136]       = "1"
        line[137..144]  = i.created_at.strftime('%Y%m%d')
        line[145..146]  = "21"
        line[147]       = "0"
        line[148]       = "0"
        line[149..150]  = "02"
        line[151..153]  = "070"
        line[154..157]  = "0208"
        line[158..187]  = I18n.transliterate(i.city.name.mb_chars.ljust(30)).upcase  
        line[188..195]  = i.due.strftime('%Y%m%d')  
        line[196..209]  = i.value.to_i.to_s.ljust(14)  
        line[210..221]  = "#{i.wallet}#{i.sequential_without_digit}#{i.sequential_digit_one}#{i.sequential_digit_two}".ljust(12, ' ') 
        line[222..223]  = "00"
        line[224..237]  = "0".ljust(14, '0') 
        line[238..251]  = "0".ljust(14, '0') 
        line[252..253]  = "00"
        line[254..261]  = "0".ljust(8, '0') 
        line[262..275]  = "0".ljust(14, '0') 
        line[276..277]  = "13"
        line[278..279]  = "00"
        line[280..281]  = "00"
        line[282..283]  = "00"
        line[284..288]  = "00000"
        line[289..328]  = "CODHAB/GDF".ljust(40)
        line[329..368]  = " ".ljust(40)
        line[369..400]  = " ".ljust(32)
        line.slice!(0)
        text << line
      end

      new_text = ""
      text.each {|t| new_text += "#{t}\r\n" }
        

      self.header_content = "#{header}\r\n"
      self.content = new_text

     # Invoice.find(invoices.map(&id)).update_all(remittance: true)
    end
  end
end
