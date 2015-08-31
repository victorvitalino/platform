module Regularization
   class  Cadastre < Candidate::Cadastre
     has_one :adjunct_cadastre, class_name: "Candidate::AdjunctCadastre"

     accepts_nested_attributes_for :adjunct_cadastre

    validates_presence_of :rg, :place_birth, :born, :arrival_df
   end
end
