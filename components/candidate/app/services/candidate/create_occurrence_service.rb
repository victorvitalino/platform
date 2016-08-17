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
          add_occurrence(validate, object.map(&:id)) if object.present?
        else 
          add_occurrence(validate, object.map(&:id)) if object.nil?
        end
      end
    end

    private

    def validates_per_program
      Candidate::Validation.where("'#{@cadastre.program_id}' = ANY (program_id) AND status = true")
    end

    def add_occurrence(validate, object_return)
      object_id =  object_return.present? ? object_return : nil

      occurrences = @cadastre.cadastre_occurrences.where(
        program_id:          @cadastre.program_id,
        target_model_name:   validate.target_model_query,
        target_model_id:     object_id
      )

      if occurrences.present?
        current = occurrences.max(:created_at)
        if current.created_at < Time.now - 1.month && !current.solved 
          occurrence = @cadastre.cadastre_occurrences.new({
            occurrence_situation_id: validate.occurrence_situation_id,
            occurrence_type_id:      validate.occurrence_type_id,
            program_id:              @cadastre.program_id,
            creator_id:              @user.id,
            target_model_name:       validate.target_model_query,
            target_model_return:     object_id
          })
        end
      end

    end
  end
end