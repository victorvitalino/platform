module HabitationPortal
  class Authenticate
    include ActiveModel::Model

    attr_accessor :cpf, :password, :born, :email, :id

    validates :cpf, cpf: true, presence: true
    validates :password, presence: true

  end
end