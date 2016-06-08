require_dependency 'visit/application_controller'

module Visit
  class LiftingsController < ApplicationController
      
    has_scope :by_cpf
    has_scope :by_localization
    has_scope :by_name
    
    def index
      @lifts = apply_scopes(Visit::Lifting).all.order(:localization)
    end

    def new
    end
    
  end
end
