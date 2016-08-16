module Attendance
  module Enabled
    class DependentMirror < Candidate::DependentMirror
      belongs_to :cadastre_mirror

      def self.model_name
        ActiveModel::Name.new("Attendance::Enabled::DependentMirror", nil, "DependentMirror")
      end

      validates :name, :gender, :civil_state, :kinship, :income, :special_condition, presence: true
      validates_date :born, presence: true

      validates :cid, presence: true, if: :special_condition_present?
      validates :percentage, presence: true, if: :co_acquirer_present?

      validates :cpf, cpf: true, presence: true, if: :major_age?
      validates :rg, presence: true, if: :major_age?
      validates :rg_org, presence: true, if: :major_age?

      private 

      def special_condition_present?
        # 2 => deficiente | 4 => deficiente e idoso
        [2, 4].include? self.special_condition_id
      end

      def co_acquirer_present?
        self.co_acquirer.present?
      end

      def major_age?
        self.born.present? ? self.age >= 18 : false 
      end
    end
  end
end

