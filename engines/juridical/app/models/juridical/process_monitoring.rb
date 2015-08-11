module Juridical
  class ProcessMonitoring < ActiveRecord::Base
    belongs_to :action_type
    belongs_to :local_instance
    belongs_to :lawyer_responsible,  class_name: "Person::Staff"
  end
end
