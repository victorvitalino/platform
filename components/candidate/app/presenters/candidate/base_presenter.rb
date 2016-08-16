module Candidate
  class BasePresenter < SimpleDelegator

    include Pundit
 
    def initialize(model, view)
      @model, @view = model, view
      super(@model)
    end

    def h
      @view
    end
    
  end
end