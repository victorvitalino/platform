module Firm
  class EnterpriseStatus < ActiveRecord::Base

    belongs_to :cadastre
    belongs_to :enterprise_cadastre

    belongs_to :status_cadastre

    mount_uploader :archive_file, Firm::ArchiveFileUploader

    validates_presence_of :status_cadastre

    private

    def self.create_status(cadastre, enterprise_cadastre, status, observation, archive_file, enterprise, user_company)
        @enterprise_status = Firm::EnterpriseStatus.new
          @enterprise_status.cadastre_id = cadastre
          @enterprise_status.enterprise_cadastre_id = enterprise_cadastre
          @enterprise_status.status_cadastre_id = status
          @enterprise_status.observation = observation
          @enterprise_status.archive_file = archive_file
          @enterprise_status.enterprise_id = enterprise
          @enterprise_status.user_company_id = user_company
          @enterprise_status.save

    end

  end
end