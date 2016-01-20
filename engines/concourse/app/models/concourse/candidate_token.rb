module Concourse
  class CandidateToken < ActiveRecord::Base
    belongs_to :candidate

    validates :secret_key, uniqueness: true

    before_create :set_secret_key
    before_create :set_status_key

    private

    def set_secret_key
      self.secret_key = Digest::SHA1.hexdigest("#{self.candidate.name}#{Time.now}")
    end

    def set_status_key
      @bulk = CandidateToken.where(candidate_id: self.candidate.id, status: false)

      if @bulk.present?
        @bulk.update_all(status: true)
      end
    end
  end
end
