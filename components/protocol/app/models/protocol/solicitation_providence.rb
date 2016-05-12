module Protocol
  class SolicitationProvidence < ActiveRecord::Base
    has_many :solicitation_replies
  end
end
