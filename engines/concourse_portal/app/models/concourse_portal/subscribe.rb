module ConcoursePortal
  class Subscribe
    include ActiveModel::Model

    attr_accessor :subscribe, :password

    validates_presence_of :subscribe, :password
  end
end