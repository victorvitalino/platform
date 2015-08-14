module Attendance
  class Station < ActiveRecord::Base
    belongs_to :city, class_name: "Address::City"

    enum station_type: ['cidade consolidada', 'parcelamento formal', 'N/D']

    validates_presence_of :name, :city, :station_type
  end
end
