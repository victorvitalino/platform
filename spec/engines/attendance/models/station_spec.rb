require 'rails_helper'

context Attendance::Station do
  let(:station) { Attendance::Station.new }

  it 'should match the full name' do
    expect(Attendance::Station.test).to eq('123')
  end
end