module Protocol
  class Conduct < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :allotment

    enum :conduct_type => [:doc_create, :doc_send, :doc_return, :doc_cancel, :doc_receive]

  end
end
