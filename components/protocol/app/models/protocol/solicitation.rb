module Protocol
  class Solicitation < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :authenticate, class_name: "Person::Staff"

    has_many :solicitation_replies

    attr_accessor :document_number, :document_type

    enum :priority => [:one, :two, :three, :emergency]

  end
end
