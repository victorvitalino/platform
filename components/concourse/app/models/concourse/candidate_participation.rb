module Concourse
  class CandidateParticipation < ActiveRecord::Base
    belongs_to :candidate

    
    validates :team_description, :archive_one, :archive_two,
              :archive_three,:archive_four,:archive_five, presence: true

    validates :archive_one, :archive_two,
              :archive_three,:archive_four,:archive_five,
              file_size: { less_than_or_equal_to: 3.megabytes.to_i,
              message: "Arquivo não pode exceder 3 MB" }

    validates :archive_one, :archive_two,
              :archive_three,:archive_four,:archive_five,
              file_content_type: { allow: ['application/pdf'],
              message: 'Somente arquivos no formato PDF' }
   
    
    mount_uploader :archive_one, ConcoursePortal::FileUploader 
    mount_uploader :archive_two, ConcoursePortal::FileUploader 
    mount_uploader :archive_three, ConcoursePortal::FileUploader 
    mount_uploader :archive_four, ConcoursePortal::FileUploader 
    mount_uploader :archive_five, ConcoursePortal::FileUploader 
  end
end
