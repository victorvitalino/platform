module Schedule
  class DataReference < ActiveRecord::Base

    validates :cpf, cpf: true
  end
end
