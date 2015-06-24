module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :project
    belongs_to :city
    belongs_to :state

    
    attr_accessor :password_confirmation
    
    before_save :encrypt_password
    

    validates_presence_of :name, :cpf, :telphone, :email, :password, :password_confirmation

    validates :cpf,   :presence => true, :uniqueness => true
    validates :email, :presence => true, :uniqueness => true
    validates_length_of :password, :in => 6..20, :on => :create
    validates_confirmation_of :password
    validates_presence_of :password, :on => :create

    
    def self.authenticate(cpf, password)
      candidate = find_by_cpf(cpf)
      if candidate && candidate.password_hash == BCrypt::Engine.hash_secret(password, candidate.password_salt)
        candidate
      else
        nil
      end
    end
    
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
  end
end
