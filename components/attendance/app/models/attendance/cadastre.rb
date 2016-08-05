module Attendance
  class Cadastre < ActiveRecord::Base

    belongs_to :type, foreign_key: "attendance_type_id"
    
    belongs_to :staff,      class_name: "Person::Staff"
    belongs_to :supervisor, class_name: "Person::Staff"
    belongs_to :cadastre,   class_name: "Candidate::Cadastre"

    has_many :cadastre_checklists

    enum status: ['pendente', 'finalizado', 'cancelado']

    def protocol
      "#{self.id}"
    end

    def cancel!(user, params)
      if params[:cancel_observation].empty?
        self.errors.add(:cancel_observation, "Observação não pode ficar em branco")
      else
        self.canceler_id        = user.id
        self.cancel_observation = params[:cancel_observation]
        self.cancel_date        = Time.now
        self.status             = 2
        self.save
      end
    end
  end
end
