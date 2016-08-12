module Concourse
  class CandidateParticipation < ActiveRecord::Base
    belongs_to :candidate

    
    validates :archive_one, :archive_two,  presence: true

    validates :candidate, uniqueness: true 

    validates :archive_one, file_size: { less_than_or_equal_to: 18.megabytes.to_i, 
                                        message: "Arquivo não pode exceder 18 MB" } 

    validates :archive_two, file_size: { less_than_or_equal_to: 3.megabytes.to_i,
              message: "Arquivo não pode exceder 3 MB" }

    validates :archive_one, :archive_two, file_content_type: { allow: ['application/pdf'],
              message: 'Somente arquivos no formato PDF' }
   
    
    mount_uploader :archive_one, ConcoursePortal::FileUploader 
    mount_uploader :archive_two, ConcoursePortal::FileUploader 
  end
end
