module Sefaz
  class FileUploader < CarrierWave::Uploader::Base
    
    storage :file if Rails.env.development? || Rails.env.test?
    storage :sftp if Rails.env.production?

    def store_dir
      "uploads/files"
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
