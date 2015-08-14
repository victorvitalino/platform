class UserCandidate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :session_limitable
  
  belongs_to :account, polymorphic: true
  
  validates :username, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def candidate?
    (self.account_type == "Candidate::Cadastre")
  end

end

