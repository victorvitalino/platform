module HabitationPortal
  module ApplicationHelper

    def faixa(income)
      case income
      when 0..1600
        'faixa 1'
      when 1601..3275
        'faixa 2'
      when 3276..5000
        'faixa 3'
      else
        'faixa 4'
      end
    end

    def position(income,  program, situation, cpf)
      sql = "program_id = ? AND situation_status_id = ? AND income BETWEEN ? AND ?"
      case income
      when 0..1600
        @geral = Candidate::View::GeneralPontuation.where(sql, program, situation, 0, 1600).map(&:cpf).find_index(cpf)
      when 1601..3275
        @geral = Candidate::View::GeneralPontuation.where(sql, program, situation, 1601, 3275).map(&:cpf).find_index(cpf)
      when 3276..5000
        @geral = Candidate::View::GeneralPontuation.where(sql, program, situation, 3276, 5000).map(&:cpf).find_index(cpf)
      else
        @geral = Candidate::View::GeneralPontuation.where(sql, program, situation, 5000, 999999).map(&:cpf).find_index(cpf)
      end

      "#{@geral + 1} º" if @geral.present?
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

    def list(born, program, special_condition)
      if born.present?
        days = (Date.today - born).to_i / 365
        if days >= 60 && special_condition == 1 || special_condition == 4
          "LISTA DE IDOSOS"
        elsif special_condition == 2 || special_condition == 3
          "LISTA DE DEFICIÊNTES"
        else
          if program == 4
            "LISTA DE VULNERÁVEIS"
          else
            if program == 1
              "LISTA RII"
            elsif program == 2
              "LISTA RIE"
            end
          end
        end
      else
        "Sem informação"
      end
    end
  end
end
