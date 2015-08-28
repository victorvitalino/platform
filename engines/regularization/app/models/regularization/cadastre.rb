module Regularization
   class  Cadastre < Candidate::Cadastre
     has_one :adjunct_cadastre, class_name: "Candidate::AdjunctCadastre"

         accepts_nested_attributes_for :adjunct_cadastre


   end
end
