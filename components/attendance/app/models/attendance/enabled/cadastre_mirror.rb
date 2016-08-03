module Attendance
  module Enabled
    class CadastreMirror < Candidate::CadastreMirror
      has_many :dependent_mirrors

      validates :cid, presence: true, if: :special_condition_present?
      validates :income, presence: true
      validates_date :born, presence: true
      validate :is_major_age?

      private 

      def special_condition_present?
        # 2 => deficiente | 4 => deficiente e idoso
        [2, 4].include? self.special_condition_id
      end

      def is_major_age?
        if self.born.present?
          errors.add(:born, 'candidato não pode ter menos que 18 anos') if self.age < 18
        end
      end
    end
  end
end

