module Protocol
  class Conduct < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :allotment
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :sector, class_name: "Person::Sector"

    enum :conduct_type => [:doc_create, :doc_send, :doc_return, :doc_cancel, :doc_receive]

    validates :conduct_type, uniqueness: { scope: [:assessment_id, :allotment_id] }

    # scope :search_doc, => {where()}


    def set_data(user, assessment)
      @assesstment = Protocol::Assessment.find(assessment)

      self.sector_id = user.account.sector_current.id
      self.assessment_id = @assesstment.id
      self.staff_id = user.account_id
      self.conduct_type = 0

    end
  end
end
