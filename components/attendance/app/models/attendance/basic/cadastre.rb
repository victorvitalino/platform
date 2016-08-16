module Attendance
  module Basic
    class Cadastre < Candidate::Cadastre

      validates :telephone, :cep, :city, :address, presence: true

    end
  end
end