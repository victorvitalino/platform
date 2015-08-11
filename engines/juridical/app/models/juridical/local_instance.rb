module Juridical
  class LocalInstance < ActiveRecord::Base
    belongs_to :instance
  end
end
