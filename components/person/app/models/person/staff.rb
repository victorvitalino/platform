module Person
  class Staff < ActiveRecord::Base

    #audited

    scope :status, -> (status = true) {where(status: status)}
    scope :sector, -> sector_current_id {where(sector_current_id: sector_current_id)}
    scope :name_user, -> (name) {where('name like ?', "%#{name.upcase}%")}
    scope :code, -> (code) {where(code: code)}

    has_one :user, as: :account, dependent: :destroy
    accepts_nested_attributes_for :user

    has_one :attendant, class_name: "Attendance::Attendant"
    has_one :helpdesk_attendant, class_name: "Helpdesk::TicketAttendant"

    has_many :permissions, class_name: "Person::StaffPermission"
    has_many :responsible, class_name: "Person:Sector"
    has_many :conducts, class_name: "Protocol::Conduct"

    belongs_to :sector_origin,   class_name: "Person::Sector"
    belongs_to :sector_current, class_name: "Person::Sector"

    belongs_to :job

    #validates_uniqueness_of :code

    #validates :password, presence: true,
      #              confirmation: true,
      #              length: {within: 6..40}

    #validates :cpf, cpf: true, on: :create
    #validates_date :born, :before => lambda {18.years.ago}



    #validates :avatar, :personal_image, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
  #  validates :avatar, :personal_image, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                            # message: 'Somente arquivos .jpg ou .png' }



  #  validates :curriculum, file_size: { less_than_or_equal_to: 60.megabytes.to_i,
                        #              message: "Arquivo não pode exceder 60 MB" }
    #validates :curriculum, file_content_type: { allow: ['application/pdf',   'application/docx',
                                              #         'application/doc',   'application/xls',
                                                  #     'application/xlsx',  'application/ppt',
                                          #             'application/pptx',  'application/zip'],
                                            #  message: 'Somente arquivos (.doc, .docx, .xls, .xlsx, .ppt. .pptx ou .zip)' }

    mount_uploader :avatar, Archive::ImageUploader
    mount_uploader :personal_image, Archive::ImageUploader
    mount_uploader :curriculum, Archive::FileUploader


    def account
        self
    end
  end
end
