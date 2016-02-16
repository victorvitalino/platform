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
        "PESSOAS COM DEFICIÊNCIA"
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

    def cpf_mask(cpfs)
        cpf1 = cpfs
        cpf = cpf1[6, 3]
        cpf2 = cpf1[9, 2]
        cpf = "XXX.XXX.#{cpf}-#{cpf2}"
   end


  end
end
