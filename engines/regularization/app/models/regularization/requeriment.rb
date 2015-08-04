module Regularization
  class Requeriment < ActiveRecord::Base
    validates :cpf, cpf: true

    enum marital_status: [:stable_union, :single]

    validates_presence_of :name, :cpf, :rg, :born, :income, :telephone,
                          :gender, :marital_status, :nationality, :email
    
    validates_date :born, before: Time.now - 18.years

    validates :spouse_cpf, cpf: true, presence: true, if: :union?
    validates :spouse_name, presence: true, if: :union?

    private

    def union?
      self.stable_union?
    end

  end
end
