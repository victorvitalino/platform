module Candidate
  class Validation < ActiveRecord::Base
    belongs_to :program

    validates :name, :target_model_query, :target_model_function, :program_id, :code, presence: true 
    validates :code, uniqueness: true


    def program_names
      Candidate::Program.where(id: self.program_id).map(&:name)
    end
  end
end
