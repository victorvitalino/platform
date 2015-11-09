module Entity
  class MemberJob < ActiveRecord::Base

    has_many :members

    validates :name, :code, presence: true
    validates :code, uniqueness:  true
  end
end
