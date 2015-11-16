module Helpdesk
  class TicketType < ActiveRecord::Base
    belongs_to :sector
    has_many :ticket_attendants
    has_many :ticket_subjects

    validates :sector_id, :title, presence: true
    validates :title, uniqueness: true

  end
end
