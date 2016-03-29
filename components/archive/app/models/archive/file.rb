module Archive
  class File < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"

    default_scope -> { where(deleted: false)}
    
    validates :original_name, presence: true, uniqueness: true

    validates :file_path, presence: true
    validates :file_path, file_size: { less_than_or_equal_to: 100.megabytes.to_i,
                                       message: "Arquivo não pode exceder 100 MB" }
   
    mount_uploader :file_path, Archive::FileUploader 
    
  end
end
