module Candidate
  class IndicationQuery

    attr_accessor :min_income, :max_income, :enterprise_id

    def initialize(options = {})
      @min_income     = options[:min_income]    ||= 0
      @max_income     = options[:max_income]    ||= 0
      @enterprise_id  = options[:enterprise_id] ||= nil
      @program_id     = options[:program_id]    ||= nil
    end

 
  end
end