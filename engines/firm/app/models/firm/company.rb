module Firm
  class Company < ActiveRecord::Base
    belongs_to :city,   class_name: "Address::City"

    validates_presence_of :name, :trade,:cnpj #, :cep, :city, :address, :telephone

    validates :cnpj, cnpj: true



  end
end
