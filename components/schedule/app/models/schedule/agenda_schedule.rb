module Schedule
  class AgendaSchedule < ActiveRecord::Base

    scope :by_date,   -> (date = Date.today) {where(date: Date.parse(date))}
    scope :by_status, -> (status) {where(status: status)}
    scope :by_cpf,    -> (cpf) {where(cpf: cpf)}
    scope :by_hour,   -> (hour) {where(hour: hour)}

    belongs_to :city, class_name: "Address::City"
    belongs_to :agenda

    enum status: ['agendado', 'liberado_para_retorno', 'cancelado', 'finalizado_sem_retorno']

    validates :name, presence: true
    validates :cpf, cpf: true, presence: true, unless: :cnpj_present?
    validates :cnpj, cnpj: true, presence: true, if: :cnpj_present?

    validates :telephone, numericality: true, presence: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates_date :date, presence: true 
    validates :hour, presence: true
    
    validate :unique_schedule, on: :create, unless: :cnpj_present?
    validate :unique_schedule_cnpj, on: :create, if: :cnpj_present?
    validate :validate!, on: :create
    
    validate :restriction!, on: :create, if: :restriction_enabled?

    validates :observation, :status, presence: true, on: :update
    
    def protocol
      "AG#{self.id}/#{self.created_at.strftime('%Y')}"
    end

    private

    def cnpj_present?
      self.cnpj.present? || !self.cnpj.to_s.empty?
    end

    def restriction_enabled?
      agenda.existente? || agenda.inexistente?
    end

    def restriction!
      
      if !cnpj_present?
        if agenda.existente?
          if !Schedule::AgendaSchedule.find_by_sql("#{agenda.restriction_sql} AND cpf = '#{self.cpf}'").present?
            errors.add(:cpf, 'este CPF não tem permissão de participar desta agenda')
          end
        end

        if agenda.inexistente?
          if Schedule::AgendaSchedule.find_by_sql("#{agenda.restriction_sql} AND cpf = '#{self.cpf}'").present?
            errors.add(:cpf, 'este CPF não tem permissão de participar desta agenda')
          end
        end
      else
        if !Entity::Cadastre.complete.where(cnpj: self.cnpj).present?
          errors.add(:cnpj, 'este CNPJ ainda não completou o recadastramento, favor acessar a área de recadastramento de entidade e verificar as pendências.')
        end
      end
    end

    def validate!
      if agenda.disable_dates.present? && agenda.disable_dates.to_s.split(';').include?(self.date.to_s)
        errors.add(:date, 'data não díspónivel')
      end

      hour = self.hour.strftime('%H:%M') rescue '00:00'

      if !agenda.hours(self.date).include? hour
        errors.add(:hour, 'horário não dispónivel')
      end
    end

    def unique_schedule_cnpj

      if agenda.agenda_schedules.where("cnpj = ? AND status = 0 AND date >= ?", cnpj, Date.today).present?
        errors.add(:cnpj, 'este CNPJ já se encontra agendado, favor verificar')
      end

      if agenda.agenda_schedules.where("cnpj = ? AND status = 3", cnpj).present?
        errors.add(:cnpj, 'este CNPJ já foi atendido, em caso de dúvidas entre em contato com a Codhab')
      end

    end

    def unique_schedule
      if agenda.agenda_schedules.where("cpf = ? AND status = 0 AND date >= ?", self.cpf, Date.today).present?
        errors.add(:cpf, 'este CPF já se encontra agendado, favor verificar')
      end

      if agenda.agenda_schedules.where("cpf = ? AND status = 3", self.cpf).present?
        errors.add(:cpf, 'este CPF já foi atendido, em caso de dúvidas entre em contato com a Codhab')
      end

    end
  end
end
