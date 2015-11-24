module Candidate
  class List < ActiveRecord::Base

    extend FriendlyId
    friendly_id :title, use: :slugged

    enum list_type: ['extranet', 'portal']

    validates :title, :condition_sql, :list_type, :view_target, presence: true
    validates :title, uniqueness: true

    def self.view_targets
      %w(Candidate::View::GeneralCandidate Candidate::View::GeneralPontuation)
    end
  end
end
