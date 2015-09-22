module Candidate
  class Convocation < ActiveRecord::Base
    enum :convocation_type => ['regularização', 'habitação']

    validates_presence_of :description, :criterion, :start, :end, :quantity, :convocation_type
    validates_date :start, before: :end
  end
end
