module Concourse
  class Candidate < ActiveRecord::Base
    has_one :user, as: :account, dependent: :destroy
    accepts_nested_attributes_for :user
    
    belongs_to :project
    belongs_to :city
    belongs_to :state

    has_many :erollments, class_name: "Concourse::EnrollmentCandidate"
    enum :sex => [:masculino, :feminino]

    validates_presence_of :name, :email,:sex
    validates :cpf, cpf: true, presence: true
    validates_numericality_of :telphone_optional, :celphone, allow_blank: true
    validates :telphone, numericality: true, presence: true
  end
end
