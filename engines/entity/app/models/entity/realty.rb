module Entity
  class Realty < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :cadastre_mirror
    belongs_to :city, class_name: "Address::City"

    enum situation: ["sede", "outros"]
    validates :city, :address, :burgh, :number, :situation, presence: true

    def complete_address
      "#{self.city.name} - #{self.address} #{self.complement} - #{self.number}"
    end

  end
end
