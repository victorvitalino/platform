module Notify
  module ApplicationHelper

    def log_in_module(type)
      case type
      when 'Concourse::Candidate'
        'Área de concursos Codhab'
      when 'Person::Staff'
        'Extranet Codhab'
      end
    end


  end
end
