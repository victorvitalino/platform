module Candidate
  class ProceduralStatus < ActiveRecord::Base

    validates :name, presence: true, uniqueness: true
    validates :code, uniqueness: true

  end
end
