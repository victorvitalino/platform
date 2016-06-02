module Action
  class Cadastre < ActiveRecord::Base
    belongs_to :city
    belongs_to :state, class_name: "Address::State"
    belongs_to :profession
    belongs_to :atuation_area
    belongs_to :formation_area

    validates :password, presence: true,
                    confirmation: true,
                    length: {within: 6..40}
  end
end
