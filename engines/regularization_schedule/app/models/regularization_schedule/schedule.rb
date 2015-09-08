module RegularizationSchedule
  class Schedule < ActiveRecord::Base

    belongs_to :agenda
    belongs_to :requiriment

    enum :status => [:attendance_waiting, :attended]

    validates_presence_of :agenda, :cpf,:date_schedule,:hour_schedule

    validates :cpf, cpf: true, presence: true
    validate :requeriment?, :open_schedule?

    private

    def requeriment?
      @requeriment = Regularization::Requeriment.find_by_cpf(self.cpf)
      errors.add(:cpf, 'este cpf não possuí requerimento.') if !@requeriment.present?
    end

     def open_schedule?
      @open_schedule = RegularizationSchedule::Schedule.where(cpf: self.cpf, status: false)
      errors.add(:cpf, 'este cpf possuí agendamento aberto.') if @open_schedule.present?
    end


  end
end
