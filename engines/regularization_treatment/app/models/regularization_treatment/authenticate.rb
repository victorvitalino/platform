module RegularizationTreatment
  class Authenticate

    include ActiveModel::Model

    attr_accessor :id, :login, :password, :procedural_status, :description

    validates :login, :password, :procedural_status, :description, presence: true

    def procedural_status
        @procedural_status = Candidate::ProceduralStatus.all
    end

    def login

    end

  end
end