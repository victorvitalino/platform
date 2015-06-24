module Concourse
  class Session
    include ActiveModel::Model

    attr_accessor :cpf, :password
  end
end