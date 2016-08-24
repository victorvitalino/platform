require 'rails_helper'

RSpec.describe Brb::CalculateSupport do

  before do 
    @base_key_default = '00005860020061000001070'
    @calc_support     =  Brb::CalculateSupport.new(@base_key_default)
  end

  describe 'calculate digit' do
    it 'module 10' do
      expect(@calc_support.calc_module_10).to eq(4)
    end

    it 'module 11' do
      expect(@calc_support.calc_module_11).to eq(5)
    end
  end

end