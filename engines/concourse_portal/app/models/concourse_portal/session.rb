module ConcoursePortal
  class Session
    include ActiveModel::Model

    attr_accessor :_id, :subscribe, :password

    validates_presence_of :subscribe, :password

    validate :authenticate?


    private

    def authenticate?
      @candidate = Concourse::Candidate.where(id: self.subscribe, password: self.password) 
      if @candidate.present?
        self._id = @candidate.first.id
      else
        errors.add(:subscribe, 'inscrição ou senha não conferem') 
      end
    end
  end
end