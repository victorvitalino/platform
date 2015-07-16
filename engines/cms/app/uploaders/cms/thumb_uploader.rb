# encoding: utf-8

class Cms::ThumbUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/images"
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
