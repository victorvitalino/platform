module Candidate
  class List < ActiveRecord::Base

    extend FriendlyId
    friendly_id :title, use: :slugged

    scope :portal, ->   { where(list_type: 1, publish: true)}
    scope :extranet, -> { where(list_type: 0, publish: true)}

    scope :habitation,      -> { where(program_id: [1,2])}
    scope :regularization,  -> { where(program_id: [3])}

    enum list_type: ['extranet', 'portal']

    validates :title, :list_type, :view_target, presence: true
    validates :title, uniqueness: true

    def self.view_targets
      %w(Candidate::View::GeneralCandidate 
         Candidate::View::GeneralPontuation 
         Candidate::Cadastre 
         Candidate::View::GeneralRegularization)
    end
  end
end
