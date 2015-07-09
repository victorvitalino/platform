module Protocol
  class Assessment < ActiveRecord::Base
    belongs_to :document_type
    belongs_to :subject
    belongs_to :staff
    belongs_to :sector

    validates_presence_of :document_type, :subject, :requesting_unit, :external_agency

    DOCUMENT_REGEX = /(\d{3})\.?(\d{3})\.?(\d{3})-?(\d{4})/

    scope :last_document, -> (sector, type, year) { where(:sector_id => sector, :document_type_id => type, :create_at.year => year)}


    before_create :generate_number

    def set_data(staff)
        @staff = Person::Staff.find(user)
        self.staff_id =  @staff.id
        self.sector_id = @staff.sector_current.id if @staff.sector_current.present?
        self.sector_prefex = @staff.sector_current.prefex if @staff.sector_current.present?
    end

    private

    def generate_number

        @document_type = Protocol::DocumentType.find_by_id(self.document_type_id)

        self.prefex = (@document_type.present?) ? @document_type.prefex  : self.sector_prefex
        self.year = Time.now.year

        self.number = (last_document(self.sector_id, tipo, self.year).number.present?) ? "%06d" % Assessment.last_document(user.sector.id, tipo, self.year).number + 1 : "%06d" % 1
        @next_number = 1

        @number = "%06d" % @next_number
        @number = "#{self.prefex.to_s}" + "#{@number}" + "#{self.year.to_s}"
        @number =~ DOCUMENT_REGEX
        @number = "#{$1}-#{$2}.#{$3}/#{$4}"

        self.document_number = @number
    end




  end
end
