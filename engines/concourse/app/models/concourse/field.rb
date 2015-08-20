module Concourse
  class Field < ActiveRecord::Base
    belongs_to :subscribe
    belongs_to :participation

    enum field_type: [:text,:boolean,:file]
    
    validates_presence_of :label, :field_type
    validates :max_size, presence: true, if: :file?
    validates :file_white_list, presence: true, if: :is_file?


    private

    def is_file?
      self.file?
    end
  end
end
