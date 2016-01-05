module HabitationPortal
  module ApplicationHelper

    def translate_list(list)
      case list
      when 'rii'
        "RII"
      when 'rie'
        "RIE"
      when 'older'
        "IDOSOS"
      when 'vulnerable'
        "VULNERÁVEL"
      when 'special'
        "DIFICIÊNTES"
      end
        
    end

    def program(id)
      case id
      when 1
        'RII'
      when 2
        'RIE'
      when 4
        'VULNERÁVEL'
      end
    end

   


  end
end
