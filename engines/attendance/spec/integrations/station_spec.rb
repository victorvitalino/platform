require 'spec_helper'

describe 'station page' do
  it 'listing station' do
    visit '/stations'
    page.should have_content('Welcome')
  end
end