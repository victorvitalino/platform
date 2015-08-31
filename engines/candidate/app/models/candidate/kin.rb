module Candidate
  class Kin < ActiveRecord::Base


    has_one :kin_adjunct

    accepts_nested_attributes_for :kin_adjunct
    
    belongs_to :special_condition

    validates_presence_of :name,:born

    validates :rg_uf, length: { is: 2 }

    validates_presence_of :cpf, :if => :old?

   def old?
     old = advance(:born => -18)
     old >= 18
   end

  end
end
