module Sefaz
  class ExemptionFile
    include ActiveModel::Model

    attr_accessor :file_path, :user_id, :allotment_id


    validates :file_path, presence: true
    validates :file_path, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :file_path, file_content_type: { allow: ['text/csv'], message: 'Somente arquivos .csv' }

    def import_file!

      return false unless self.valid?

      CSV.foreach(self.file_path.path, headers: true) do |row|
        exemption_hash = row.to_hash

        exemption = Sefaz::Exemption.where(cpf: exemption_hash["CPF"])
        exemption_new = Sefaz::Exemption.new
        exemption_new.name                   = exemption_hash["NOME"]
        exemption_new.cpf                    = exemption_hash["CPF"].to_s.unformat_cpf
        exemption_new.city                   = exemption_hash["CIDADE"]
        exemption_new.address                = exemption_hash["ENDERECO"]
        exemption_new.realty_number          = exemption_hash["IPTU"]
        exemption_new.realty_value           = exemption_hash["VALOR"]
        exemption_new.allotment_id           = self.allotment_id
        exemption_new.staff_id               = self.user_id

        begin
          exemption_new.save!
        rescue Exception => e
          errors.add(:file_path, "Ocorreu um erro ao processar, cpf: #{exemption_new.cpf}, #{e.message}")
        end
      end

   end

  end
end
