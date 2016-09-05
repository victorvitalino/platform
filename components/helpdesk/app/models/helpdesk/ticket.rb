module Helpdesk
  class Ticket < ActiveRecord::Base
    belongs_to :ticket_type
    belongs_to :requester, class_name: "Person::Staff"
    belongs_to :attendant, class_name: "Helpdesk::Staff"
    belongs_to :ticket_subject
    belongs_to :sector, class_name: "Person::Sector"

    has_many :ticket_ocurrences

    mount_uploader :file_path, Helpdesk::FilePathUploader

    enum status: [:open, :in_progress, :closed, :scheduled]

    scope :open,        -> { where(status: 0).order('created_at desc') }
    scope :in_progress, -> { where(status: 1).order('created_at desc') }
    scope :closed,      -> { where(status: 2).order('created_at desc') }
    scope :scheduled,   -> { where(status: 3).order('created_at desc') }

    validates :ticket_type, :ticket_subject_title, presence: true
    validates :description, :code_computer, presence: true


    def ticket_subject_title
      ticket_subject.try(:title)
    end

    def ticket_subject_title=(title)
      if title.present? && self.ticket_type.present?
        self.ticket_subject = Helpdesk::TicketSubject.find_or_create_by(title: title, ticket_type_id: self.ticket_type_id)
      end
    end

  end
end
