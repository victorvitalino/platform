module Protocol
  class DigitalDocument < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :staff, class_name: "Person::Staff"

    mount_uploader :doc_path, Protocol::DocPathUploader

  end
end
