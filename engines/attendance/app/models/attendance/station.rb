module Attendance
  class Station < ActiveRecord::Base
    belongs_to :city, class_name: "Address::City"
    belongs_to :convocation, class_name: "Candidate::Convocation"

    default_scope {where(status: true)}

    has_many :attendants, class_name: "StationAttendant"
    has_many :counters, -> { where(status: true) }

    # Habitação = 1
    # Parcelamento Informal = 2
    # Cidade Consolidada = 3

    enum station_type: ['N/D','parcelamento_informal', 'cidade_consolidada']

    validates_presence_of :name, :city, :station_type
    
    private

    def self.test
      '123'
    end

  end
end
