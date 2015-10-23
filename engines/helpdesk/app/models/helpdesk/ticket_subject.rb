module Helpdesk
  class TicketSubject < ActiveRecord::Base
    belongs_to :ticket_type

    validates :title, presence: true, uniqueness: true

    after_validation :set_downcase

    private

    def set_downcase
      self.title = self.title.to_s.downcase
    end
  end
end
