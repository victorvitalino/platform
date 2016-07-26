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

    def self.current_sector(current_user)
      current_sector_id = current_user.sector_current_id

      if current_user.administrator?
        sector_id  = Person::Sector.status(true).map(&:id)
      else
        sector_id  = Person::Sector.status(true).where(father_id: current_sector_id).map(&:id)
      end

      current_sector_id = (sector_id.present?) ? sector_id : current_sector_id
      self.all.joins(:staff).where('person_staffs.sector_current_id in (?)', current_sector_id)
    end

  end
end
