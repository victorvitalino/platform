module Dashboard
  class Warning < ActiveRecord::Base
    validates_presence_of :title, :date, :category, :color
    enum category: [ "Avisos","Divirta-se"]
    enum color: ["Vermelho", "Verde", "Azul", "Amarelo", "Preto", "Rosa"]

    validates  :thumbnail, file_size: { less_than_or_equal_to: 10.megabytes.to_i }
    validates  :thumbnail, file_content_type: { allow: ['image/jpeg', 'image/png'],
                                              message: 'Somente arquivos .jpg ou .png' }

    mount_uploader :thumbnail, Archive::ImageUploader
  end
end
