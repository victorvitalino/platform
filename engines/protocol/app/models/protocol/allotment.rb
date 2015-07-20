module Protocol
  class Allotment < ActiveRecord::Base
    belongs_to :user
    has_many :conduct
    enum :priority => [:Baixa, :Media, :Alta]

  end
end
