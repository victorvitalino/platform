module Entity
  class DocumentCategory < ActiveRecord::Base

    validates  :name, :code, presence: true
    validates  :code, uniqueness: true
  end
end
