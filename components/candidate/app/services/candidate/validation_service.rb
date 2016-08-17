module Candidate
  class ValidationService
    
    attr_accessor :cadastre 

    def initialize(object = nil)
      @cadastre = object
    end

    def validates(array = [])
      methods  = array
      validate = []
      
      methods.each do |item|
        current_validate = self.send("check_#{item}")
        validate << current_validate if !current_validate.nil?
      end

      return validate
    end

    private

    def check_iptu
      input = Candidate::Iptu.where(cpf: @cadastre.cpf.unformat_cpf)
      return nil if input.present?
      { description: "Encontrados #{input.count} registro(s) de iptu", situation_id: 1, type_id: 1}
    end

    def marital_check
    end

  end
end