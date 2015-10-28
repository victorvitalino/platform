# encoding: utf-8

class Cms::ThumbnailUploader < CarrierWave::Uploader::Base
    
  storage :file if Rails.env.development? || Rails.env.test?
  storage :sftp if Rails.env.production?
  
  def store_dir
    "content/thumbs"
  end

  def extension_white_list
	  %w(jpg jpeg gif png)
	end

	def filename
	  if original_filename
	    @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
	    "#{@name}.#{file.extension}"
	  end
	end
end
