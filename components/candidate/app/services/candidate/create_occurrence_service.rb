module Candidate
  class CreateOccurrenceService
    
    def initialize(cadastre)
      @cadastre = cadastre
    end

    def self.create(*args)
      new(*args).create
    end

    def create!
      validate_cadastre!
    end


    def validate_cadastre!
      validates_per_program.each do |validate|
        object = "#{validate.target_model_query}".constantize
        object = object.send("#{validate.target_model_function}", @cadastre.cpf) rescue false
        
        if validate.contain
          add_occurrence(validate, object) if object.present?
        else 
          add_occurrence(validate, object) if object.nil?
        end
      end
    end

    private

    def validates_per_program
      Candidate::Validation.where("'#{@cadastre.program_id}' = ANY (program_id) AND status = true")
    end

    def add_occurrence(validate, object)
      object_id =  object.present? ? object.id : nil
      # <Candidate::Validation id: 1, 
      # name: "IPTU existente? ",
      # description: "",
      # code: "rii_iptu", 
      # target_model_query:
      # "Candidate::Iptu", 
      # target_model_function: "find_by_cpf",
      # contain: false, program_id: ["", "1", "2", "4", "5", "6", "7", "8"],
      # occurrence_situation_id: nil, status: true, 
      # created_at: "2016-08-15 18:26:51",
      # updated_at: "2016-08-15 18:41:06">

      occurrence = @cadastre.cadastre_occurrences.new({
        occurrence_situation_id: validate.occurrence_situation_id
      })
    end
  end
end