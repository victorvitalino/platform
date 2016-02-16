module RegularizationPortal
  module ApplicationHelper
    def cpf_mask(cpfs)
      cpf1 = cpfs
      cpf = cpf1[6, 3]
      cpf2 = cpf1[9, 2]
      cpf = "XXX.XXX.#{cpf}-#{cpf2}"
    end

  end
end
