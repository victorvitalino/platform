require 'rails_helper'

RSpec.describe Candidate::CadastresController, :type => :controller do
  routes { Candidate::Engine.routes }

  login_staff_admin

  describe "GET index" do
    it "has a 302 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET index" do 
    it "Testing" do 
      cadastre = create :candidate_cadastre, :in_the_future
    end
  end


end