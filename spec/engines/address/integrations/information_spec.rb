require 'rails_helper'

feature 'Get json of all cities in DF' do
  scenario 'GET cities less :state_id' do 
    visit address.cities_path
    expect(page).to have_content([])
  end
end

      