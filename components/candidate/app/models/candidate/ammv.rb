module Candidate
  class Ammv < ActiveRecord::Base
    
    def cadastre_exists?
      Candidate::Cadastre.find_by_cpf(self.cpf) rescue nil
    end
  end
end
