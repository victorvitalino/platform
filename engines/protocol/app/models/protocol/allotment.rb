module Protocol
  class Allotment < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    has_many :conducts

    enum :priority => [:Baixa, :Media, :Alta]

  end
end
