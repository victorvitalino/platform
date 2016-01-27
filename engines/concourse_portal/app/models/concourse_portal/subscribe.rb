module ConcoursePortal
  class Subscribe < Concourse::Subscribe
    has_many :candidates
  end
end