module Candidate
  class SearchCadastreService
    
    attr_accessor :cpf, :assessment, :name, :candidate

    def initialize(args = {})
      @cpf        = args[:cpf]        ||= nil 
      @assessment = args[:assessment] ||= nil 
      @name       = args[:name]       ||= nil
      @candidate  = {}
    end

    def search!
      document = Protocol::Assessment.find_by_document_number(@assessment) rescue nil
      
      if document.candidate.present?
        document 
      else 

        @candidate = Candidate::Cadastre.where(cpf: @cpf.unformat_cpf) if @cpf.present?
        @candidate = Candidate::Cadastre.where("name ILIKE '%#{@name}%'").limit(20) if @name.present?

        @candidate
      end
    end
  end
end