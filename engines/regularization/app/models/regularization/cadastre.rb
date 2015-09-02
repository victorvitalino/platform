module Regularization
   class  Cadastre < Candidate::Cadastre
     has_one :adjunct_cadastre, class_name: "Candidate::AdjunctCadastre"

     accepts_nested_attributes_for :adjunct_cadastre

     validates_presence_of :rg, :place_birth, :born

    def set_treatment(convocation, status,cadastre)
         @treatment = ::Candidate::AttendanceCadastre.new
         @treatment.adjunct_cadastre_id = cadastre
         @treatment.convocation_id = convocation
         @treatment. attendance_status_id = status
         @treatment.status = true
         @treatment.save
    end


   end
end

