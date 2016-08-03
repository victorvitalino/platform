module Attendance
  module ApplicationHelper
    def present(model_name, model)
      klass = "#{model_name}Presenter".constantize
      presenter = klass.new(model, self)

      return presenter
    end
  end
end
