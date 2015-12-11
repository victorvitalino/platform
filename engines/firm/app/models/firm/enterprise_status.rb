module Firm
  class EnterpriseStatus < ActiveRecord::Base

    belongs_to :cadastre
    belongs_to :enterprise_cadastre
    belongs_to :status_cadastre

    mount_uploader :archive_file, Firm::ArchiveFileUploader

    validates_presence_of :status_cadastre



  end
end