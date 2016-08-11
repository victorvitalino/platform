module Protocol
  class Conduct < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :allotment
    belongs_to :staff, -> { where(status: true).order(:name) }, class_name: "Person::Staff"
    belongs_to :sector, -> { where(status: true).order(:name) }, class_name: "Person::Sector"

    enum :conduct_type => [:doc_create, :doc_send, :doc_return, :doc_cancel, :doc_receive]

    validates :conduct_type, uniqueness: { scope: [:assessment_id, :allotment_id, :conduct_type] }

    scope :find_last, -> { where(created_at: Conduct.select("MAX(created_at)").group(:assessment_id))}

    scope :find_sector, -> (sector,type) { where(id: Conduct.select("MAX(id)").group(:allotment_id), conduct_type: type, sector_id: sector)}

    scope :find_allotment, -> (allotment) { where(created_at: Conduct.select("MAX(created_at)").where(allotment_id: allotment).group(:assessment_id), conduct_type: 0)}


    # QUERY DO
    scope :find_document, -> (document_number, document_type, type, sector_id,document_current){
    where(created_at: Protocol::Conduct
              .joins(:assessment)
              .select("MAX(protocol_conducts.created_at)")
              .where("protocol_assessments.document_number = ?
                           AND protocol_assessments.document_type_id = ?
                           AND protocol_conducts.sector_id = ? AND protocol_assessments.id <> ?",
                          document_number, document_type, sector_id,document_current)
              .group(:assessment_id), conduct_type: type)}



    def set_data(user, assessment)
      @assesstment = Protocol::Assessment.find(assessment)

      self.sector_id = user.sector_current.id
      self.assessment_id = @assesstment.id
      self.staff_id = user.id
      self.conduct_type = 0

    end
  end
end
