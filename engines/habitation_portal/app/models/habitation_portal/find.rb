module HabitationPortal
  class Find
    include ActiveModel::Model

    attr_accessor :cpf
    
    validates :cpf, cpf: true, presence: true
  
  end
end