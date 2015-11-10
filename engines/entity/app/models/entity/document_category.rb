module Entity
  class DocumentCategory < ActiveRecord::Base

    scope :statuses, -> (status = true) { where(status: status )}

    validates  :name, :code, presence: true
    validates  :code, uniqueness: true
  end
end
