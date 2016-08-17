module Concourse
  class CandidateParticipation < ActiveRecord::Base
    belongs_to :candidate

    audited 

    has_many  :team_participations, dependent: :destroy
    accepts_nested_attributes_for :team_participations, allow_destroy: true, reject_if: :all_blank

    validates :archive_one, :archive_two, :archive_three,  presence: true

    validates :candidate, uniqueness: true 


    validates :archive_one, :archive_two, file_content_type: { allow: ['application/pdf'],
                                                              message: 'Somente arquivos no formato PDF' }

    validates :archive_three, file_content_type: { allow: ['image/png', 'image/jpeg'],
                                                   message: 'Somente arquivos no formato PNG ou JPEG'}
                                                   
    validates :archive_one,   file_size: { less_than_or_equal_to: 18.megabytes.to_i, 
                                         message: "Arquivo não pode exceder 18 MB" }
    
    validates :archive_two,   file_size: { less_than_or_equal_to: 3.megabytes.to_i, 
                                         message: "Arquivo não pode exceder 3 MB" }

    validates :archive_three, file_size: { less_than_or_equal_to: 3.megabytes.to_i,
                                            message: "Arquivo não pode exceder 3 MB" }   
    
    mount_uploader :archive_one,   ConcoursePortal::FileUploader 
    mount_uploader :archive_two,   ConcoursePortal::FileUploader 
    mount_uploader :archive_three, ConcoursePortal::FileUploader 
  end
end
