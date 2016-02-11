module Archive
  class File < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"

    default_scope -> { where(deleted: false)}
    
    validates :original_name, presence: true, uniqueness: true

    validates :file_path, presence: true
    validates :file_path, file_size: { less_than_or_equal_to: 60.megabytes.to_i,
                                       message: "Arquivo não pode exceder 60 MB" }
    validates :file_path, file_content_type: { allow: ['application/pdf',   'application/docx',
                                                       'application/doc',   'application/xls',
                                                       'application/xlsx',  'application/ppt',
                                                       'application/pptx',  'application/zip'],
                                              message: 'Somente arquivos (.doc, .docx, .xls, .xlsx, .ppt. .pptx ou .zip)' }
    mount_uploader :file_path, Archive::FileUploader 
    
  end
end
