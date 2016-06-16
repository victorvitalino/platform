module Visit
  class Lifting < ActiveRecord::Base

    scope :by_localization, -> (value) { where("localization ILIKE '%#{value}%'") }
    scope :by_cpf,          -> (value) { where(cpf: value) }
    scope :by_name,         -> (value) { where("name ILIKE '%#{value}%'") }

    validates :photo_one, :photo_two, :photo_three, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates :photo_one, :photo_two, :photo_three, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }

    mount_uploader :photo_one, Archive::ImageUploader
    mount_uploader :photo_two, Archive::ImageUploader
    mount_uploader :photo_three, Archive::ImageUploader

    enum benefit: ["Bolsa Família","BPC","Auxílio-reclusão"]
    enum pension: ["Alimentícia","Por Morte","Por Doença"]
    enum deficiency: ["Auditiva","Física","Mental","Visual"]
    enum lot_situation: ["Vazio","Ocupado"]
    enum busy_lot: ["Beneficiário Original","Terceiro","Imóvel Invadido"]
    enum busy_lot_user: ["Ausente", "Presente"]
    enum lot_vacated: ["estado de abandono", "vazio","Outros"]
    enum civil_status: ["Solteiro(a)","Casado(a)","União Estável","Separado(a)","Divorciado(a)","Viúvo(a)"]
  end
end
