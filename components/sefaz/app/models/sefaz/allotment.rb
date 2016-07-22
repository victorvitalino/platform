module Sefaz
  class Allotment < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :send_status

    has_many :exemptions

    enum exemption_type: {itbi: 1, itcd: 2}
    enum send_type: [:cancelation, :send_allotment]

    validates :exemption_type,  presence: true
    validates :notifiers,  presence: true
    validates :cnpj_notifiers, presence: true, cnpj: true, numericality: true


    scope :protocolo, -> (protocolo) {where(protocol_return: protocolo)}
    scope :date_create, -> (date_create) {where("created_at::date = to_date(?, 'dd/MM/YYYY')", date_create)}
    scope :notifiers, -> (notifiers) {where(notifiers: notifiers)}
    scope :send_status, -> (send_status) {where(send_status_id: send_status)}
    scope :send_type, -> (send_type) {where(send_type: send_type)}


  end
end
