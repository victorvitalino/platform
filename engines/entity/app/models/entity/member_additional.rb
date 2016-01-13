module Entity
  class MemberAdditional < ActiveRecord::Base
    belongs_to :member_job
    belongs_to :member

    validates :cnpj, :social_reason, :member_job, :start, :end, presence: true
    validates :cnpj, uniqueness: { scope: :member_id}
    validates :cnpj, cnpj: true
  end
end
