module Sefaz
  class FileUploader < CarrierWave::Uploader::Base
    
    storage :file

    def store_dir
      "files/sefaz/archives"
    end

    def extension_white_list
      %w(csv)
    end

    def filename
      if original_filename
        @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "#{@name}.#{file.extension}"
      end
    end
  end
end
