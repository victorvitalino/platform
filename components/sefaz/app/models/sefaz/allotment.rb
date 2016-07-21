module Sefaz
  class Allotment < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :send_status

    has_many :exemptions

    enum exemption_type: {itbi: 1, itcd: 2}

    validates :exemption_type,  presence: true
    validates :notifiers,  presence: true
    validates :cnpj_notifiers, presence: true, cnpj: true, numericality: true

  end
end
