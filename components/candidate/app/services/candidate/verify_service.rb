module Candidate
  class VerifyService
    
    attr_accessor :cadastre  
    
    def initialize(object = {})
      @cadastre = object ||= nil
    end

    def update_ocurrences!
      if 4 == 4
        #regularization
        object = Candidate::ValidationService.new(@cadastre) 
        validates_array = %w(iptu)

        object.validates(validates_array).each do |item|
          create_ocurrence!({
            situation_id: item[:situation_id],
            type_id:      item[:type_id],
            description:  item[:description] 
          })
        end

      else
        #habitation
      end
    end

    private

    def create_ocurrence!(options = {})
      return nil if ocurrence_on_cadastre_exists?(options[:situation_id])

      ocurrence = @cadastre.cadastre_ocurrences.new

      ocurrence.ocurrence_situation_id = options[:situation_id] ||= nil
      ocurrence.ocurrence_type_id      = options[:type_id]      ||= nil
      ocurrence.description            = options[:description]  ||= nil
      ocurrence.program_id             = @cadastre.program_id
      ocurrence.save
    end

    def ocurrence_on_cadastre_exists?(situation_id)
      @cadastre.cadastre_ocurrences.where(ocurrence_situation_id: situation_id, solved: false).present?
    end

  end
end