module Regularization
   class  Cadastre < Candidate::Cadastre
     has_many :adjunct_cadastres
     accepts_nested_attributes_for :adjunct_cadastres


     validates :rg, :place_birth, presence: true
     validates_date :born, before: Time.now - 18.years

    def set_treatment(convocation, status,cadastre,attendant)
         @treatment = ::Candidate::AttendanceCadastre.new
         @treatment.adjunct_cadastre_id = cadastre
         @treatment.convocation_id = convocation
         @treatment. attendance_status_id = status
         @treatment.attendant_id = attendant
         @treatment.status = true
         @treatment.save
    end


   end
end

