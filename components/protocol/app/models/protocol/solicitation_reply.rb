module Protocol
  class SolicitationReply < ActiveRecord::Base
    belongs_to :providence, class_name: "Protocol::SolicitationProvidence"
    belongs_to :providence_staff, class_name: "Person::Staff"
    belongs_to :responsible_delivered, class_name: "Person::Staff"
    belongs_to :authenticate, class_name: "Person::Staff"
    belongs_to :socilitation
  end
end
