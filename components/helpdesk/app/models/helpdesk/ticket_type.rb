module Helpdesk
  class TicketType < ActiveRecord::Base
    belongs_to :sector
    has_many :ticket_attendants
    has_many :ticket_subjects
    has_many :ticket_solutions
    has_many :ticket

    validates :sector_id, :title, presence: true
    validates :title, uniqueness: true

  end
end
