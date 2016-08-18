
module Sefaz
  class ExemptionFile
    include ActiveModel::Model

    attr_accessor :file_path, :user_id, :allotment_id


    validates :file_path, presence: true
    validates :file_path, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :file_path, file_content_type: { allow: ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'], message: 'Somente arquivos .xlsx' }

    def import_files!

      return false unless self.valid?

      spreadsheet = Roo::Excelx.new(self.file_path.path, nil, :ignore)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        exemption_hash = Hash[[header, spreadsheet.row(i)].transpose]

        if exemption_hash.present? && !exemption_hash.any? {|k,v| v.nil? }

          exemption = Sefaz::Exemption.where(cpf: exemption_hash["CPF"])
          exemption_new = Sefaz::Exemption.new
          exemption_new.name                   = exemption_hash["NOME"]

          cpf = exemption_hash["CPF"].to_s

          if cpf.length <= 12
            cpf = '%011d' % cpf.to_i
          end
          if cpf.length > 11
            cpf = cpf.to_i
          end

          exemption_new.cpf                    = cpf
          exemption_new.city                   = exemption_hash["CIDADE"]
          exemption_new.address                = exemption_hash["ENDERECO"]
          iptu = exemption_hash["IPTU"]
          exemption_new.realty_number          = iptu.class == Float ? exemption_hash["IPTU"].to_i : exemption_hash["IPTU"]
          exemption_new.realty_value           = exemption_hash["VALOR"]
          exemption_new.year_act               = exemption_hash["ANO"].present? ? exemption_hash["ANO"]  : nil
          exemption_new.number_act_to_cancel   = exemption_hash["NUMERO"].present? ? exemption_hash["NUMERO"].to_i : nil
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
end
