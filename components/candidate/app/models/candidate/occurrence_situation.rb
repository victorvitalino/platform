module Candidate
  class OccurrenceSituation < ActiveRecord::Base
    
    validates :name, presence: true
    validates :label_portal, presence: true, if: :is_visible_portal?

    private

    def is_visible_portal?
      self.visible_portal.present?
    end
  end
end
