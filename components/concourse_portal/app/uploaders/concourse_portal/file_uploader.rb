class ConcoursePortal::FileUploader < CarrierWave::Uploader::Base
  
  storage :file
  
  def store_dir
    "uploads/concourse/candidate/files"
  end

  def extension_white_list
    %w(pdf) 
  end

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

end
