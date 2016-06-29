module Protocol
  class Assessment < ActiveRecord::Base
    belongs_to :document_type, -> {order(:name)}
    belongs_to :subject, -> {order(:name)}
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :sector, class_name: "Person::Sector"

    has_many :conducts
    has_many :digital_documents
    has_many :locations
    has_many :controls
    has_many :call_controls

    has_many :solicitations

    has_many :attach_documents, foreign_key: "document_father_id"
    has_many :attach_document_children, class_name: "Protocol::AttachDocument", foreign_key: "document_child_id"

    scope :process,  -> (process) {where(document_number: process)}
    scope :doc_type,  -> (doc_type) {where(document_type_id: doc_type)}
    scope :cpf,  -> (cpf) {where(cpf: cpf)}
    scope :sector,  -> (sector) {where(sector_id: sector)}
    scope :subject,  -> (subject) {where(subject_id: subject)}

    scope :date_start, -> (date_start) { where("protocol_assessments.created_at::date >= ?", Date.parse(date_start))}
    scope :date_end, -> (date_end) { where("protocol_assessments.created_at::date <= ?", Date.parse(date_end))}



  #  before_save :set_number

    #validates :document_type,  presence: true
  #  validates :subject, presence: true
    #validates :requesting_unit, presence: true
    #validates :document_number, uniqueness: { scope: [:document_type] }, presence: true

    #after_create :set_conduct

    def set_conduct
        current_user = Person::Staff.find(self.staff_id)
        @conduct  = Protocol::Conduct.new
        @conduct.conduct_type = 0
        @conduct.assessment_id = self.id
        @conduct.staff_id = current_user.id
        @conduct.sector_id = current_user.sector_current.id
        @conduct.save
    end


    def set_staff(staff_id)
        self.staff_id = staff_id
    end

    def self.to_csv(options = {})
       CSV.generate(options) do |csv|
         csv << all.first.attributes.keys
             all.each do |assessment|
               csv << assessment.attributes.values
             end
       end
    end

    private

    def set_number

      current_user = Person::Staff.find(self.staff_id)
        if  current_user.sector_current.present?
           self.staff_id    =  current_user.id

           document_type = Protocol::DocumentType.find(self.document_type_id)

           self.prefex = (!document_type.prefex.nil?) ? document_type.prefex  : self.sector.prefex
           self.year = Time.now.year

           documents = Assessment.where(sector_id: self.sector_id, document_type_id:  self.document_type_id, year: self.year).last

           self.number = (documents.present?) ? documents.number + 1 :  1

           format_document_number

        end
    end




    def format_document_number
        number = "#{self.prefex}#{'%06d' % self.number}#{self.year}"
        number =~ /(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{4})/
        number = "#{$1}-#{$2}.#{$3}/#{$4}"

        self.document_number = number
    end




  end
end
