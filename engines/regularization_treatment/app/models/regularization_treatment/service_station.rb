module RegularizationTreatment
  class ServiceStation < ActiveRecord::Base
    belongs_to :city
    belongs_to :convocation
  end
end
