require 'csv'

module Sefaz
  class Exemption < ActiveRecord::Base
    belongs_to :send_status
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :staff_send, class_name: "Person::Staff"
    belongs_to :allotment

    validate :virtual_validate!

  def self.xml(new_exemption)

   xml = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') { |xml|

     xml.ArrayofImovelConstruido do
       new_exemption.each do |exemption|
         xml.imovelConstruido(id: exemption.id ) do
           xml.nomeTransmitente exemption.allotment.notifiers
           xml.cnpj  exemption.allotment.cnpj_notifiers.gsub('.','').gsub('-','').gsub('/','')
           xml.nomeAdquirente exemption.name
           xml.cpfAdquirente exemption.cpf.gsub('.','').gsub('-','')
           xml.enderecoCompleto exemption.address
           xml.inscricaoImovel exemption.realty_number
           xml.tipoTransacao exemption.allotment.exemption_type == "ITBI" ? 1 : 2
           xml.valorPactuado exemption.realty_value
         end
       end
       xml.Signature(xmlns:"http://www.w3.org/2000/09/xmldsig#" ) do
         xml.SignedInfo do
           xml.CanonicalizationMethod(Algorithm: "http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
           xml.SignatureMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#rsa-sha1")
           xml.Reference(URI: "") do
            xml.Transforms do
              xml.Transform(Algorithm:"http://www.w3.org/2000/09/xmldsig#enveloped-signature")
              xml.Transform(Algorithm:"http://www.w3.org/TR/2001/REC-xml-c14n-20010315")
            end
            xml.DigestMethod(Algorithm:"http://www.w3.org/2000/09/xmldsig#sha1")
            xml.DigestValue "Sz6U97pYO4t4k8pBtv8egpQMtqM="
           end
         end
         xml.SignatureValue "WWsmiSrpztVRCFOkGnX1d2FTCeu0hxd0krXHI3fhmm0Dw983YpolJ4/OTDXNFJBLSq52ftqoPG/aUmd2wcWW1eLD5WZO6ONlFGCHBRN1jPRYl0iwu2OihsDfVa+kwhBttMpQ/UzOGbgMm3xGSIEV+ADrgzMMGamdcu1Ol0UQiQHNiDOyDF/uBlVS+LvQpvM7tAaCyBcBuKo+04mEW6baXz25U3E//iJazs/uYaWBJ0UehKBnlWSWB1lgk1ZJI7ht8n1zVjaPHkIp/SZ31tToBthSgMHbALWsRRdQXIK7yqO0/CSwmgdkGu8TNf7Hih2VRE7ElS7mghLZhOl07zyteA=="
         xml.KeyInfo do
           xml.X509Data do
             xml.X509Certificate "MIIIezCCBmOgAwIBAgIQUxdul9aF6bD98slw/aEwNjANBgkqhkiG9w0BAQsFADB4MQswCQYDVQQGEwJCUjETMBEGA1UEChMKSUNQLUJyYXNpbDE2MDQGA1UECxMtU2VjcmV0YXJpYSBkYSBSZWNlaXRhIEZlZGVyYWwgZG8gQnJhc2lsIC0gUkZCMRwwGgYDVQQDExNBQyBDZXJ0aXNpZ24gUkZCIEc0MB4XDTE1MDQwNjAwMDAwMFoXDTE4MDQwNDIzNTk1OVowggEIMQswCQYDVQQGEwJCUjETMBEGA1UEChQKSUNQLUJyYXNpbDELMAkGA1UECBMCREYxETAPBgNVBAcUCEJSQVNJTElBMTYwNAYDVQQLFC1TZWNyZXRhcmlhIGRhIFJlY2VpdGEgRmVkZXJhbCBkbyBCcmFzaWwgLSBSRkIxFjAUBgNVBAsUDVJGQiBlLUNOUEogQTMxKTAnBgNVBAsUIEF1dGVudGljYWRvIHBvciBBUiBGZWNvbWVyY2lvIERGMUkwRwYDVQQDE0BDT01QQU5ISUEgREUgREVTRU5WT0xWSU1FTlRPIEhBQklUQUNJT05BTCBETyBESVNUOjA5MzM1NTc1MDAwMTMwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtvYI0p+WlwRWNH1uo+fGLdUNZNn82C1jZhFgB1CFGBGk2ih+TLCP6ytl4xyR0tOsszTbgC8AsJ8MHRbt1XZUnYV0j3zywg5QXOqwUAvTI9blNQ0e7okaf5VhcvC92ksgAR6hy1CBA8Zwb/FyI/lBlKmS8OWwMvLp/QIbZylBloh3ss6uJFuRR8Bb2dZniT4P3DHXGGQivE0Ae9l6HagUWCRtCF/UTeLi4404VfARnABq5GuGBww3ZZnSYglPBEMxwB9MxYSITuDnKWu6ni0GgRfVEVfQirRBQdI6Ap/jE9c5M3Zj/3UrePLIQAjo2eZiQompGJJ7HWMcuAe1Q5KWbQIDAQABo4IDbTCCA2kwgdIGA1UdEQSByjCBx6A9BgVgTAEDBKA0BDIyODA0MTk1NTExOTc4ODU2MTcyMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDU3NzZTU1BERqAwBgVgTAEDAqAnBCVHSUxTT04gSk9TRSBQQVJBTkhPUyBERSBQQVVMQSBFIFNJTFZBoBkGBWBMAQMDoBAEDjA5MzM1NTc1MDAwMTMwoBcGBWBMAQMHoA4EDDAwMDAwMDAwMDAwMIEgZ2VvdmFuZS5tYXJ0aW5zQGNvZGhhYi5kZi5nb3YuYnIwCQYDVR0TBAIwADAfBgNVHSMEGDAWgBQukerWbeWyWYLcOIUpdjQWVjzQPjAOBgNVHQ8BAf8EBAMCBeAwfwYDVR0gBHgwdjB0BgZgTAECAwYwajBoBggrBgEFBQcCARZcaHR0cDovL2ljcC1icmFzaWwuY2VydGlzaWduLmNvbS5ici9yZXBvc2l0b3Jpby9kcGMvQUNfQ2VydGlzaWduX1JGQi9EUENfQUNfQ2VydGlzaWduX1JGQi5wZGYwggEWBgNVHR8EggENMIIBCTBXoFWgU4ZRaHR0cDovL2ljcC1icmFzaWwuY2VydGlzaWduLmNvbS5ici9yZXBvc2l0b3Jpby9sY3IvQUNDZXJ0aXNpZ25SRkJHNC9MYXRlc3RDUkwuY3JsMFagVKBShlBodHRwOi8vaWNwLWJyYXNpbC5vdXRyYWxjci5jb20uYnIvcmVwb3NpdG9yaW8vbGNyL0FDQ2VydGlzaWduUkZCRzQvTGF0ZXN0Q1JMLmNybDBWoFSgUoZQaHR0cDovL3JlcG9zaXRvcmlvLmljcGJyYXNpbC5nb3YuYnIvbGNyL0NlcnRpc2lnbi9BQ0NlcnRpc2lnblJGQkc0L0xhdGVzdENSTC5jcmwwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMIGbBggrBgEFBQcBAQSBjjCBizBfBggrBgEFBQcwAoZTaHR0cDovL2ljcC1icmFzaWwuY2VydGlzaWduLmNvbS5ici9yZXBvc2l0b3Jpby9jZXJ0aWZpY2Fkb3MvQUNfQ2VydGlzaWduX1JGQl9HNC5wN2MwKAYIKwYBBQUHMAGGHGh0dHA6Ly9vY3NwLmNlcnRpc2lnbi5jb20uYnIwDQYJKoZIhvcNAQELBQADggIBAIkrkr9znEherwSqs3cqDzxgpeSlQn0f2hvP9pECO9IL6p+1XRUg+q36NVXcBzhWaPHedhp6MrLtqJ13Oe/7XL1E7cuSlkAONX1FjXopEQp9xMcDe/Q73bW5PaZs+8AkREalNpLRoWVFkxuJGubKqE2KFrg+xYobl4J9Lq3tfWJq6O6SyNsQq65jkw64PyWL7hSGRYURltTzt0uGY1I/YNyaEvzyYcy5HIZF5x/IAQXHrEBMaXfnB+Zt9h2DgB8/ZqtjxPvUyGjzvc3jp1eu+URFvO9yG5tBYoo50ToH9sNNZ9qHMeXh84P2iDDBRIRgVPxZFGtU2VFpXcpvtnRD3/O3MJ0TTv+qqZn+nEaw4f1xjU107ICAvmqo/LtjJd1FBszE6btSeUniPQr8XnnDg+e7o8V8KgDlDbK6kUJMAnX9+MzDWcfb10DLr929XUd8NPXlRsoXHSa3vBpRfIz3MXs6vC0AI+r2D6Ywc5Q7dKmrqCLqdviO2J9iiL7GCxiCrX2Wv30y0RPZLqKAM4GKiLvoyCcsM3Qr5YXzO/JMdt8fFUgASdcJp8l20B31C2a7sb5NssGfHdg9ohQ9LfJ0nUrc46iEt0+oOrLLR6gbiABh+DD9/rn6jZvP34LgtkvubR9hJQRNzwxvIRc2em1euUIkaAzb7mS51/hVtaIy9xBX"
           end
         end
       end
     end
     }.to_xml

   end


    private

    def virtual_validate!

      
      add_message_error("CPF inválido")       if !ValidatesCpfCnpj::Cpf.valid?(self.cpf.format_cpf)
      add_message_error("Nome em branco")     if self.name.to_s.empty?
      add_message_error("CPF em branco")      if self.cpf.to_s.empty?
      add_message_error("Cidade em branco")   if self.city.to_s.empty?
      add_message_error("Endereço em branco") if self.address.to_s.empty?
      add_message_error("IPTU em branco")     if self.realty_number.to_s.empty?
      add_message_error("Valor em branco")    if self.realty_value.to_s.empty?

    end

    def add_message_error(message)
      self.system_message  = "" if self.system_message.nil?
      self.system_message += "#{message};"
    end




  end
end
