# encoding: utf-8
class RedactorRailsDocumentUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave

  storage :sftp

  def store_dir
    "redactor/files"
  end

  def extension_white_list
    RedactorRails.document_file_types
  end
end
