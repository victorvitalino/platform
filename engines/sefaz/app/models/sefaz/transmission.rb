module Sefaz
  class Transmission < ActiveRecord::Base

    has_many :transmission_candidates
    
    CSV_COLUMNS = %w(SETOR TIPO_ISENCAO ORGAO_TRANSMITENTE CNPJ_TRANSMITENTE NOME CPF CIDADE ENDERECO INSCRICAO_IMOVEL VALOR_UNITARIO)

    enum status: ['aguardando_envio', 'aguardando_sefaz', 'concluído', 'recusada']

    mount_uploader :csv, FileUploader
    mount_uploader :xml, FileUploader

    validate :csv_valid?

    after_commit :insert_csv!, on: :create

    def protocol; "#{'%05d' % self.id}"; end;

    private

    def insert_csv!
      index = 0
      CSV.foreach("public/#{self.csv}") do |line|
        
        if index > 0
          @candidate = TransmissionCandidate.new({
            transmission_id: self.id,
            sector: line[0],
            exemption_type: line[1],
            organization: line[2],
            cnpj: line[3],
            name: line[4],
            cpf: line[5],
            city: line[6],
            address: line[7],
            unit_code: line[8],
            unit_value: line[9]
          })

          @candidate.save
        end

        index += 1
      end
    end

    def csv_valid?
        
      index = 0

      CSV.foreach("public/#{self.csv}") do |line|
        
        if index == 0  
          if line != CSV_COLUMNS
            errors.add(:csv, 'Formatação do arquivo é inválida') 
            break
          end
        else
          line.each do |field|
            if field.to_s.empty?
              errors.add(:csv, 'Arquivo inválido. Existem campos vazios em seu arquivo, verfique!') 
              break
            end
          end
        end

        index += 1
      end
    end
  end
end
