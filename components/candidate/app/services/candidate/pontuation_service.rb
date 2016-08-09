module Candidate
  class PontuationService
    
    attr_accessor :cadastre_mirror

    attr_accessor :min_salary, :dsp_value, :created_at_value
   
    # => PMB são os pontos máximos de tempo de residência no Distrito Federal.
    # =>1.1. Tempo de residência no Distrito Federal: 4.000 pontos, distribuídos diretamente proporcional
    # ao tempo apurado com base nos dados cadastrais; 
    PMB = 4000
    
    # => PML são os pontos máximos de tempo de inscrição em Programas Habitacionais.
    # => 1.2. Tempo de inscrição em Programas Habitacionais no DF: 1.500 pontos, distribuídos de acordo
    # com o tempo apurado com base nos dados cadastrais;
    PML = 800

    # => PMR são os pontos máximos de renda familiar per capita.
    # => 1.5. Renda familiar mensal bruta per capita: 500 pontos, distribuídos inversamente proporcional
    # ao valor da renda mensal bruta per capita apurada com base nos dados cadastrais; 
    PMR = 500 

    # => DIC é a data de início do cadastro = 01/01/1958. 
    DIC = Date.parse('01/01/1958')

    # => DIL é a data de início das inscrições em Programas Habitacionais = 01/01/1993.
    DIL = Date.parse('01/01/1993')
    


    def initialize(options = {})
      @cadastre_mirror = Candidate::CadastreMirror.find(options[:cadastre_mirror_id])

      return nil if @cadastre_mirror.nil?
        # => SAL_MIM é o valor do salário mínimo na data de geração dos pontos.
      @min_salary        = options[:min_salary]   ||= 880.0
      @dsp_value         = options[:dsp]          ||= proc_dsp
      @created_at_value  = @cadastre_mirror.created_at.strftime("%Y-%m-%d")
    end

    def scoring_cadastre!
      total_score = income_score + special_dependent_score + dependent_score + timelist_score + timebsb_score

      {total: total_score.round(10), income_score: income_score, special_dependent_score: special_dependent_score,
       dependent_score: dependent_score, timelist_score: timelist_score, timebsb_score: timebsb_score}
    end

    # => MB_11 recebe valor igual a um (1) se o candidato teve classificação no Morar Bem em 2011,
    # ou recebe valor igual a zero (0) se o candidato não teve classificação no Morar Bem em 2011.
    def mb_11
      @cadastre_mirror.cadastre.pontuations.where(code: 20110801).present? ? 1 : 0
    end

    # => DSP é a data de geração dos pontos.
    def proc_dsp
      '01/01/2016'
    end

    def dsp 
      Date.parse(@dsp_value) rescue nil
    end

    # => data de inscrição do cadastre_mirror
    def created_at
      Date.parse(@created_at_value) rescue nil
    end

    # => MADIL são os pontos médios anteriores a data de início das inscrições.
    # => MADIL = ( PML + PML * (DSP – DIL) / (DSP – DIC) ) / 2 
    def madil
      (PML + PML * ((dsp - DIL).to_i) / ((dsp - DIC).to_i)) / 2
    end

    # => f) PT_RENDA(i) = PMR* (SAL_MIN * 12 – (R_TOTAL(i) / (DP(i)+1))) / (SAL_MIN * 12)
    def income_score
      (PMR * (@min_salary * 12 - (@cadastre_mirror.income / (@cadastre_mirror.dependent_mirrors.count + 1))) / (@min_salary * 12)).round(10)
    end

    # =>  PT_MB_ESP(i) = SE (MB_ESP(i) >= 4, 300*4 + 300*CH_ESP(i), SENÃO (MB_ ESP(i)*300 + 300*CH_ESP(i))
    # MB_ESP(i) é o número de membros da família do candidato com condições especiais. 
    # CH_ESP(i) recebe valor igual a um (1) se o candidato tiver condição especial, ou recebe valor igual a zero (0) se o candidato não tiver condição especial.
    def special_dependent_score

      current_special_status    = (@cadastre_mirror.special_condition_id > 1) ? 1 : 0
      special_dependents_count  = 0

      # => .each para 
      @cadastre_mirror.dependent_mirrors.each do |dependent|
        if dependent.special_condition_id == 2 || dependent.age >= 60
          special_dependents_count += 1
        end
      end

      if special_dependents_count >= 4
          1200 + (300 * current_special_status)
      else
        (special_dependents_count * 300) + (300 * current_special_status)  
      end

    end

    # => PT_DP(i) = SE (DP(i) >= 5, 5*500, SENÃO(DP(i)*500))
    def dependent_score
      dependent_count = @cadastre_mirror.dependent_mirrors.count 
      (dependent_count >= 5) ? 2500 : (dependent_count * 500)
    end


    # =>  PT_LISTA(i) = SE (E (DT_CHEGADA_DF(i) < DIL, DT_INSCRICAO(i) = DIL), MADIL,
    # SENÃO (PML*(DSP – DT_INSCRICAO(i)) / (DSP – DIC) + MB_11*700))
    def timelist_score
      #=> DATA REFERENTE PARA CALCULO DE 2012 - 01/10/2012 - NAO PERDER ESSA DATA
      #UNS MANE JA PERDERAM, FAÇA O FAVOR, VALEU

      if @cadastre_mirror.arrival_df < DIL && created_at == DIL
        madil
      else 
        PML * (dsp - created_at).to_f / (dsp - DIC).to_f + mb_11 * 700
      end

    end


    # => a) PT_BSB(i) = PMB * (DSP – DT_CHEGADA_DF(i)) / (DSP - DIC) 
    def timebsb_score
      PMB * (dsp - @cadastre_mirror.arrival_df).to_f / (dsp - DIC).to_f
    end

  end
end
