module Attendance
  class ValidateService
    
    attr_accessor :cadastre_mirror_id, :cadastre_mirror

    def intialize(args = {})
      @cadastre_mirror_id = args[:cadastre_mirror_id]
      @cadastre_mirror    = set_cadastre
    end

    def iptu_present?
    end

    def cadin_present?
    end

    def income_family_major?
    end

    def voi_present?
    end

    def arrival_df_major?
    end

    def place_df?
    end

    def heir_present?
    end

    private

    def set_cadastre_mirror
      Candidate::CadastreMirror.find(self.cadastre_mirror_id) rescue nil
    end
  end
end