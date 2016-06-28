require_dependency 'candidate/application_controller'
module Candidate
  class ReportsController < ApplicationController

    def index
      authorize :report, :index?

      @enable = ::Candidate::View::GeneralPontuation.where("situation_status_id = 4 AND convocation_id > 1524 AND procedural_status_id IN(14, 72)")

      @zone1rii	= @enable.where("program_id = 1 AND income BETWEEN 0 AND 1600").count
      @zone2rii	= @enable.where("program_id = 1 AND income BETWEEN 1601 AND 3275").count
      @zone3rii	= @enable.where("program_id = 1 AND income BETWEEN 3276 AND 5000").count
      @zone4rii	= @enable.where("program_id = 1 AND income > 5000").count

      @zone1rie	= @enable.where("program_id = 2 AND income BETWEEN 0 AND 1600").count
      @zone2rie	= @enable.where("program_id = 2 AND income BETWEEN 1601 AND 3275").count
      @zone3rie	= @enable.where("program_id = 2 AND income BETWEEN 3276 AND 5000").count
      @zone4rie	= @enable.where("program_id = 2 AND income > 5000").count

      @zone1ido	= @enable.where("extract(year from age(born)) >= 60 AND income BETWEEN 0 AND 1600").count
      @zone2ido	= @enable.where("extract(year from age(born)) >= 60 AND income BETWEEN 1601 AND 3275").count
      @zone3ido	= @enable.where("extract(year from age(born)) >= 60 AND income BETWEEN 3276 AND 5000").count
      @zone4ido	= @enable.where("extract(year from age(born)) >= 60 AND income > 5000").count

      @zone1def	= @enable.where("(special_condition_id in (2,3) or (select COUNT(*) from candidate_dependents where special_condition_id in (2,3) and cadastre_id = general_pontuations.id) > 0) AND income BETWEEN 0 AND 1600").count
      @zone2def	= @enable.where("(special_condition_id in (2,3) or (select COUNT(*) from candidate_dependents where special_condition_id in (2,3) and cadastre_id = general_pontuations.id) > 0) AND income BETWEEN 1601 AND 3275").count
      @zone3def	= @enable.where("(special_condition_id in (2,3) or (select COUNT(*) from candidate_dependents where special_condition_id in (2,3) and cadastre_id = general_pontuations.id) > 0) AND income BETWEEN 3276 AND 5000").count
      @zone4def	= @enable.where("(special_condition_id in (2,3) or (select COUNT(*) from candidate_dependents where special_condition_id in (2,3) and cadastre_id = general_pontuations.id) > 0) AND income > 5000").count

      @zone1vul	= @enable.where("program_id = 4 AND income BETWEEN 0 AND 1600").count
      @zone2vul	= @enable.where("program_id = 4 AND income BETWEEN 1601 AND 3275").count
      @zone3vul	= @enable.where("program_id = 4 AND income BETWEEN 3276 AND 5000").count
      @zone4vul	= @enable.where("program_id = 4 AND income > 5000").count

    end

  end
end
