module Candidate
  class CadastreMirror < ActiveRecord::Base
    belongs_to :special_condition
    has_many :dependent_mirrors

    def arrival_df_time(date)
      date.year - self.arrival_df.strftime("%Y").to_i if self.arrival_df.present?
    end

    def timelist_time(date)
      date.year - self.created_at.year
    end
  end
end
