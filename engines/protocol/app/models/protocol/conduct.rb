module Protocol
  class Conduct < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :allotment
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :sector, class_name: "Person::Sector"

    enum :conduct_type => [:doc_create, :doc_send, :doc_return, :doc_cancel, :doc_receive]

    validates :conduct_type, uniqueness: { scope: [:assessment_id, :allotment_id] }

    scope :find_last, -> { where(created_at: Conduct.select("MAX(created_at)").group(:assessment_id))}

    scope :find_sector, -> (sector) { where(created_at: Conduct.select("MAX(created_at)").where(sector_id: sector).group(:assessment_id))}

    scope :find_allotment, -> (allotment) { where(created_at: Conduct.select("MAX(created_at)").where(allotment_id: allotment).group(:assessment_id))}

    scope :find_type_sector, -> (type,sector) { where(created_at: Conduct.select("MAX(created_at)").where(conduct_type: type, sector_id: sector).group(:assessment_id))}


    def set_data(user, assessment)
      @assesstment = Protocol::Assessment.find(assessment)

      self.sector_id = user.account.sector_current.id
      self.assessment_id = @assesstment.id
      self.staff_id = user.account_id
      self.conduct_type = 0

    end
  end
end
