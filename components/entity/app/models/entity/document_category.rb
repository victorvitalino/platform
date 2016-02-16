module Entity
  class DocumentCategory < ActiveRecord::Base

    scope :statuses, -> (status = true) { where(status: status )}
    
    scope :requireds,   -> {where(document_type: 0)}
    scope :tecnical,    -> {where(document_type: 1)}

    enum document_type: ['documentação_geral', 'documentação_técnica']
    validates  :name, :code, presence: true
    validates  :code, uniqueness: true
  end
end
