module Protocol
  class AttachDocument < ActiveRecord::Base
    belongs_to :document_father
    belongs_to :document_child
    belongs_to :attach_type
    belongs_to :sector
    belongs_to :staff

   enum :attach_type => [:attach, :append]


  end
end
