module Candidate
  class AdjunctCadastre < ActiveRecord::Base

    belongs_to :cadastre
    belongs_to :civil_state
    belongs_to :special_condition

    validates :civil_state, presence: true
    validates :income,  numericality: {only_float: true}
    validates :cid, presence: true, if: :special_condition?

    private

    def special_condition?
        self.flag_special_condition.present?
    end

  end
end
