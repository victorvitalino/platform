module Protocol
  class AttachDocument < ActiveRecord::Base
    belongs_to :document_father, class_name: "Protocol::Assessment"
    belongs_to :document_child, class_name: "Protocol::Assessment"

    belongs_to :attach_type
    belongs_to :sector, class_name: "Person::Sector"
    belongs_to :staff, class_name: "Person::Staff"


    enum :attach_type => [:attach, :append]


   def set_attach(user, assessment,type)
      @assesstment = Protocol::Assessment.find(assessment)

      self.sector_id = user.sector_current.id
      self.document_child_id = @assesstment.id
      self.staff_id = user.id
      self.attach_type = type

    end

  end
end
