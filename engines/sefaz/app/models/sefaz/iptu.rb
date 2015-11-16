require 'nokogiri'
require 'open-uri'

module Sefaz
  class Iptu
    include ActiveModel::Model 

    attr_accessor :cpf, :result

    validates :cpf, cpf: true

    def search!
      url   = "http://intranet/aplicacoes/ConsultaIPTU/resultados.cfm?lCPFCNPJ=#{self.cpf}"
      sefaz = Nokogiri::HTML(open(url)) rescue nil

      if sefaz.present?
        self.result = sefaz.xpath('//table//tr').collect do |item, index|
         detail = {}
         [
           [:registration, 'td[1]/text()'],
           [:property, 'td[2]/text()'],
           [:address, 'td[3]/text()'],
           [:cpf, 'td[4]/text()'],
           [:city, 'td[5]/text()'],
         ].each do |name, xpath|
           detail[name] = item.at_xpath(xpath).to_s.strip
        end
          detail
        end
      else
        nil
      end
    end
  end
end