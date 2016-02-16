module Concourse
  class Observation < ActiveRecord::Base
    belongs_to :candidate
    belongs_to :staff, class_name: "Person::Staff"

    enum message_type: ['interno', 'externo']

    validates :message_type, :content, presence: true
  end
end
