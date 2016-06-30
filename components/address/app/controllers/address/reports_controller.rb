require_dependency 'candidate/application_controller'
module Address
  class ReportsController < ApplicationController

    def index
      authorize :report, :index?
      @address_regularization  = Address::Unit.regularization.all

      @address_situation    = Address::Unit.regularization.joins(:situation_unit)
                                                                .group('address_situation_units.description').count

      @address_city    = Address::Unit.regularization.joins(:city)
                                                            .group('address_cities.name').count

    end

  end
end
