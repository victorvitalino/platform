module Project
  class Enterprise < ActiveRecord::Base
    belongs_to :typology, -> { order(:id) }
    belongs_to :company,  -> { order(:id) }, class_name: "Firm::Company"

    has_many :steps
    
    validates :name, presence: true
  end
end
