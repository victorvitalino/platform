# encoding: utf-8
class RedactorRailsDocumentUploader < CarrierWave::Uploader::Base
  include RedactorRails::Backend::CarrierWave

  storage :file if Rails.env.development? || Rails.env.test?
  storage :sftp if Rails.env.production?


  def store_dir
    "content/files"
  end

  def extension_white_list
    RedactorRails.document_file_types
  end
end
