class Regularization::AdjunctCadastre < Candidate::AdjunctCadastre
  has_many :kins  
  belongs_to :cadastre
 
  validates :income, presence: true
end