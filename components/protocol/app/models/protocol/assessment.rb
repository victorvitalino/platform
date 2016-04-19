module Protocol
  class Assessment < ActiveRecord::Base
    belongs_to :document_type
    belongs_to :subject
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :sector, class_name: "Person::Sector"

    has_many :conducts
    has_many :digital_documents
    has_many :locations

    has_many :attach_documents, foreign_key: "document_father_id"

    scope :process,  -> (process) {where(document_number: process)}
    scope :doc_type,  -> (doc_type) {where(document_type_id: doc_type)}
    scope :cpf,  -> (cpf) {where(cpf: cpf)}
    scope :sector,  -> (sector) {where(sector_id: sector)}
    scope :subject,  -> (subject) {where(subject_id: subject)}


    #before_validation :set_number

    validates_presence_of :document_type, :subject, :requesting_unit
    validates :document_number, uniqueness: true, presence: true

    after_create :set_conduct

    def set_conduct
        current_user = User.find_by_account_id(self.staff_id)
        @conduct  = Protocol::Conduct.new
        @conduct.conduct_type = 4
        @conduct.assessment_id = self.id
        @conduct.staff_id = current_user.account_id
        @conduct.sector_id = current_user.account.sector_current.id
        @conduct.save
    end



    def set_staff(staff_id)
        self.staff_id = staff_id
    end


    def self.set_number
        current_user = User.find_by_account_id(self.staff_id)
        if  current_user.account.sector_current.present?

           self.staff_id      =   current_user.account_id
           self.sector_id   =   current_user.account.sector_current.id

           document_type = Protocol::DocumentType.find(self.document_type_id)

           self.prefex = (!document_type.prefex.nil?) ? document_type.prefex  : current_user.account.sector_current.prefex
           self.year = Time.now.year

           documents = Assessment.where(sector_id: self.sector_id, document_type_id:  self.document_type_id, year: self.year).last

           self.number = (documents.present?) ? documents.number + 1 :  1

           format_document_number
        else
            errors.add(:document_number, "Setor não encontrado")
        end
    end

    private


    def format_document_number
        number = "#{self.prefex}#{'%06d' % self.number}#{self.year}"
        number =~ /(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{4})/
        number = "#{$1}-#{$2}.#{$3}/#{$4}"

        self.document_number = number
    end

   def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << all.first.attributes.keys
            all.each do |assessment|
              csv << assessment.attributes.values
            end
      end
   end


  end
end
