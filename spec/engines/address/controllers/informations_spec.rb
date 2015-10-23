require 'rails_helper'
require 'address'

describe Address::InformationsController, type: :controller do 
  routes { Address::Engine.routes }

  it "GET cities" do 
    get :cities, state_id: '1'
  end

end