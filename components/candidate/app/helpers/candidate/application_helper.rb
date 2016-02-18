module Candidate
  module ApplicationHelper

    include HabitationPortal::ApplicationHelper

    def pontuation(cpf, income)
      case income.to_i
      when 0..1600
        @pontuation = Candidate::View::GeneralPontuation.where("")
      when 1601..3000
      when 3001..5000
      else
      end
    end
  end
end
