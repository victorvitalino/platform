require 'rails_helper'

RSpec.describe Brb::CreateBarcodeService do

  before do 
    @barcode_service = Brb::CreateBarcodeService.new
  end

  describe '#create barcode' do
    it '.generate brb key' do
      mock   = '0000586002006100000107045'
      expect(@barcode_service.brb_key_with_digits).to eq(mock)
    end

    it '.group one' do 
      mock = '0709000053'
      expect(@barcode_service.group_one_with_digit).to eq(mock)
    end
    it '.group two' do 
      mock = '86002006103'
      expect(@barcode_service.group_two_with_digit).to eq(mock)
    end

    it '.group three' do 
      mock = '00001070457'
      expect(@barcode_service.group_three_with_digit).to eq(mock)
    end

    it '.due factor' do 
      mock = '0000'
      expect(@barcode_service.due).to eq(mock)
    end

    it '.verification barcode without digit' do 
      mock = '0709000000000001000000586002006100000107045'
      expect(@barcode_service.barcode_without_digit).to eq(mock)
    end

    it '.generate digit' do 
      mock = 6
      expect(@barcode_service.barcode_digit).to eq(mock)
    end

    it '.verification complete barcode' do 
      mock = "07090000538600200610300001070457600000000000100"
      expect(@barcode_service.barcode_with_digit).to eq(mock)
    end

  end

  describe '#barcodes concourse' do 

    it '.fix brb' do 
      mock = '07090002028014930410900984070094668950000030000'
      @barcode_service = Brb::CreateBarcodeService.new({
        due: '2016-08-23',
        value: 300,
        sequential: 984,
        bank_wallet: 1,
        bank_agency: 208,
        bank_account: '0149304'
      })

      expect(@barcode_service.barcode_with_digit).to eq(mock)
    end
  end
end