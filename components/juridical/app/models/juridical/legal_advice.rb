module Juridical
  class LegalAdvice < ActiveRecord::Base

    attr_accessor :instancy

    belongs_to :lawsuit
    belongs_to :instancy_place
    belongs_to :housing_program
    belongs_to :document_type, class_name: "Protocol::DocumentType"
    belongs_to :responsible_lawyer, foreign_key: "staff_id", class_name: "Person::Staff"
    belongs_to :staff, class_name: "Person::Staff"

    enum process_type: ['normal','eletrônico']

    has_many :complements
    has_many :complainants
    has_many :defendants

    scope :process,  -> (process) {where(process_number: process)}
    scope :lawyer,  -> (lawyer) {where(responsible_lawyer: lawyer)}
    scope :status,  -> (status) {where(status: status)}


    validates_presence_of :process_number, :agency, :lawsuit, :instancy_place

  end
end
