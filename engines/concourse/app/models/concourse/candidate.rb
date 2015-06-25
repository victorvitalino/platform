module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :project
    belongs_to :city
    belongs_to :state

    has_many :enrollment_candidates
    
    attr_accessor :password_confirmation

    validates_presence_of :name, :cpf, :email, :telphone
    validates_numericality_of :telphone_optional, :celphone, allow_blank: true
    validates_length_of :telphone_optional, :celphone, in: 8..15, allow_blank: true
    validates :password, length: { minimum: 6, maximum: 40 }, presence: true, on: :create
    validates :cpf, cpf: true, uniqueness: true
    validates :email, email: true, uniqueness: true
    validates :telphone, numericality: true,  length: { minimum: 8, maximum: 15 }
    
    validate :unique_password, on: :create
    
    private

    def unique_password
      errors.add(:password, "senhas não conferem") if self.password != password_confirmation
    end

  end
end
