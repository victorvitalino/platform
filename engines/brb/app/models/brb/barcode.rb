module Brb
  class Barcode
    include ActiveModel::Model
      ## Considerações
      # O manual do BRB é um lixo
      # O manual do BRB não explica bem como funciona e não está ordenado
      # siga a seguinte ordem para entender como é gerado o código de barras
      # => 1. Criação de Chave (Capitulo 1)
      # => 2. Criação de Fator Vencimento (Capitulo 7)
      # => 3. Criação de Fator Valor 
      # => 4. Composição de código de barras e linha digitavel 
      # => 5. Composição de código de barras

      attr_accessor :agency, :account_bank, :wallet, :bank, :coin
      attr_accessor :deadline, :deadline_factor, :value, :value_factor
      attr_accessor :sequential, :sequential_without_digit, :sequential_with_digit
      attr_accessor :sequential_digit_one, :sequential_digit_two

      attr_accessor :barcode_without_digit,:barcode_with_digit, :barcode_digit, :key
      attr_accessor :group_one, :group_two, :group_three
      attr_accessor :group_one_digit, :group_two_digit,:group_three_digit
      attr_accessor :barcode_without_format, :barcode_with_format

      # dados estáticos para gerar os boletos
      AGENCY          = "208"
      ACCOUNT_BANK    = "0149304"
      BANK            = "070"
      COIN            = "9"
      WALLET          = "2"
      DATE_CORRECTION = "03/07/2000" #Essa data é para criação do fator vencimento, capitulo 7


      def initialize(options = {})
        #argumentos dinâmicos [data de vencimento, valor do boleto, e sequencial único]
        options[:deadline]    ||= 'false'
        options[:value]       ||= 'false'
        options[:sequential]  ||= 'false'

        #set dos argumentos estáticos
        self.agency       = AGENCY 
        self.account_bank = ACCOUNT_BANK 
        self.wallet       = WALLET
        self.bank         = BANK
        self.coin         = COIN 
        
        #validação de data e criação de fator data
        #fator data é baseado no manual emitido pelo BRB onde:
        #se o argumento deadline for 0, a data será 0000
        #para entender o calculo de fator de data verifique a class Format.date_format!
        self.deadline         = options[:deadline].to_s.date_format!
        self.deadline_factor  = set_deadline_factor

        #validação de valor e criação de fator valor
        #o fator valor não realiza calculos, somente aplica a regra de tamanho de campos, inserindo zeros
        #até chegar a 10 caracteres, vide Format.is_number? e set_value_factor 
        self.value            = options[:value].to_s.is_number?
        self.value_factor     = set_value_factor

        #sequencial é um valor único que diferenciará os boletos emitidos pela sua carteira
        #este sequencial geralmente é alinhado com o ID do banco que referência o boleto
        self.sequential       = options[:sequential].to_s.is_number?
        
        #a montagem de sequencial é baseada no capitulo 1 - Composição da CHAVE
        self.sequential_without_digit = set_sequential
        self.sequential_with_digit    = set_sequential_digit
        
        #a montagem de sequencial é baseada no capitulo 3 - Composição do Códigode Barras e Linha Digitável
        self.key                      = set_key
        self.barcode_without_digit    = set_barcode_without_digit
        self.barcode_digit            = set_barcode_digit
        self.barcode_with_digit       = set_barcode_with_digit

        #a montagem dos grupos - capitulo 5
        self.group_one             = set_group_one
        self.group_one_digit       = self.group_one.to_s.module_10

        self.group_two             = set_group_two
        self.group_two_digit       = self.group_two.to_s.module_10

        self.group_three             = set_group_three
        self.group_three_digit       = self.group_three.to_s.module_10
        
        #codigo em plain para gerar o código de barras e com formatação
        #a formatação está sendo feita com concatenação, a mesma poderia ser feita com Regex, refatora ai! :)
        self.barcode_without_format  = set_barcode_without_format
        self.barcode_with_format     = set_barcode_with_format
      end

      private
      
      #construção de código de barras sem formatação
      def set_barcode_without_format
        "#{self.group_one}#{self.group_one_digit}" \
        "#{self.group_two}#{self.group_two_digit}" \
        "#{self.group_three}#{self.group_three_digit}" \
        "#{self.barcode_digit}#{self.deadline_factor}" \
        "#{self.value_factor}"
      end

      #construção de código de barras com formatação
      def set_barcode_with_format
        "#{self.barcode_without_format[0..4]}.#{self.barcode_without_format[5..9]} " \
        "#{self.barcode_without_format[10..14]}.#{self.barcode_without_format[15..20]} " \
        "#{self.barcode_without_format[21..25]}.#{self.barcode_without_format[26..31]} " \
        "#{self.barcode_without_format[32]} " \
        "#{self.barcode_without_format[33..46]}"
      end

      #construção de código dos grupos
      def set_group_one
        "#{self.bank}#{self.coin}#{self.key[0..4]}"
      end

      def set_group_two
        "#{self.key[5..14]}"
      end

      def set_group_three
        "#{self.key[15..24]}"
      end

      def group_four
        "#{self.deadline_factor}#{self.value_factor}"
      end

      #fato de data de vencimento, o manual não fala sobre datas 0, mas o manual sempre utiliza a data zerada
      #isso deve ser verificado melhor
      def set_deadline_factor
        if self.deadline.zero?
          "0000"
        else
          (Date.parse(self.deadline) - Date.parse(DATE_CORRECTION)).to_i + 1000
        end
      end

      #formatação de sequencial
      def set_sequential
        "#{'%06d' % self.sequential}#{self.bank}" 
      end

      #criação de digito do sequencial
      def set_sequential_digit
        value = "000#{self.agency}#{self.account_bank}#{self.wallet}#{self.sequential_without_digit}".calculate!

        self.sequential_digit_one = value[:digit_one]
        self.sequential_digit_two = value[:digit_two]

        "000#{self.agency}#{self.account_bank}" \
        "#{self.wallet}#{self.sequential_without_digit}" \
        "#{self.sequential_digit_one}#{self.sequential_digit_two}"
      end

      #formatação fator valor
      def set_value_factor
        "#{'%010d' % self.value.to_i}" 
      end

      #construção de chave
      def set_key
        "000#{self.agency}#{self.account_bank}" \
        "#{self.wallet}#{self.sequential_without_digit}" \
        "#{self.sequential_digit_one}#{self.sequential_digit_two}"
      end

      #construção de código de barras
      def set_barcode_without_digit
        "#{self.bank}#{self.coin}#{self.deadline_factor}#{self.value_factor}#{self.key}"
      end
      
      #isso aqui pode e deve melhorar, não é necessário concatenação, somente um Regex resolve
      def set_barcode_with_digit
        "#{self.bank}#{self.coin}#{self.barcode_digit}#{self.deadline_factor}#{self.value_factor}#{self.key}"
      end

      #realizando o calculo de digito do código de barras
      def set_barcode_digit
        self.barcode_without_digit.module_11({multiplier: [2,3,4,5,6,7,8,9]})
      end
  end
end