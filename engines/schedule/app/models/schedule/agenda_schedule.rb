module Schedule
  class AgendaSchedule < ActiveRecord::Base
    belongs_to :city, class_name: "Address::City"
    belongs_to :agenda

    enum status: ['agendado', 'liberado', 'cancelado', 'finalizado']

    validates :name, presence: true
    validates :cpf, cpf: true, presence: true
    validates :telephone, numericality: true, presence: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates_date :date, presence: true 
    validates :hour, presence: true
    validates_date :born, presence: true

    validate :unique_schedule, on: :create
    validate :validate!, on: :create

    def protocol
      "AG#{self.agenda_id}#{self.id}#{self.created_at.strftime('%Y')}"
    end

    private

    def validate!
      if agenda.disable_dates.present? && agenda.disable_dates.to_s.split(';').include?(self.date.to_s)
        errors.add(:date, 'data não díspónivel')
      end

      hour = self.hour.strftime('%H:%M') rescue '00:00'

      if !agenda.hours(self.date).include? hour
        errors.add(:hour, 'horário não dispónivel')
      end
    end

    def unique_schedule
      if agenda.agenda_schedules.where("cpf = ? AND status = 0 AND date > ?", self.cpf, Date.today).present?
        errors.add(:cpf, 'este CPF já se encontra agendado, favor verificar')
      end

      if agenda.agenda_schedules.where("cpf = ? AND status = 3", self.cpf).present?
        errors.add(:cpf, 'este CPF já foi atendido, em caso de dúvidas entre em contato com a Codhab')
      end

    end
  end
end
