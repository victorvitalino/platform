module Project
  class Enterprise < ActiveRecord::Base
    belongs_to :typology, -> { order(:id) }
    belongs_to :company,  -> { order(:id) }, class_name: "Firm::Company"

    has_many :steps
    has_many :allotments, through: :steps
    
    scope :actives, -> { where(status: true)}
    
    validates :name, presence: true
  end
end
