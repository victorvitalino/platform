module Regularization
  class Requeriment < ActiveRecord::Base
    validates :cpf, cpf: true

    enum marital_status: ['união_estável', 'solteiro']
    enum gender: [:masculino, :feminino]

    validates_presence_of :name, :cpf, :rg, :born, :income, :telephone,
                          :gender, :marital_status, :nationality, :email
    
    validates_date :born, before: Time.now - 18.years
    validates :email, email: true
    validates :spouse_cpf, cpf: true, presence: true, if: :union?
    validates :spouse_name, presence: true, if: :union?

    private

    def union?
      self.marital_status == 0
    end

  end
end
