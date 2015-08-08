module Protocol
  class DocumentType < ActiveRecord::Base
    has_many :assessment
  end
end
