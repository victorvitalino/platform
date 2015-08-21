require_dependency 'application_controller'
require 'codhab_barcode'

module Finance
  class BankSlip < ActiveRecord::Base
    belongs_to :type_slip

    validates_presence_of :type_slip, :deadline, :name
    validates :value, numericality: {only_float: true}, allow_blank: true

    validates_date :deadline, after: Date.today - 1.day
    
    before_create :set_value
    after_create :set_barcode

    validates :cpf, cpf: true, presence: true

    def self.search(search)
      query =  BankSlip.where(created_at: Date.parse(search[:start])..Date.parse(search[:end]))
      query =  query.where("type_slip_id = #{search[:type]}")                                     if search[:type].present?
      query =  query.where("status = #{(search[:status] == 'pago') ? true : false}")              if search[:status].present?
      query
    end

    def protocol
      "CODHAB#{self.id}#{self.created_at.strftime('%d%m%Y')}"
    end


    def self.barcode(bank_slip)
      CodhabBarcode::Barcode.new({value: bank_slip.value, deadline: bank_slip.deadline.strftime('%d/%m/%Y'), unique_code: bank_slip.id})
    end

    private

    def set_value
      if !self.value.present?
        self.value = type_slip.value
      end
    end

    def set_barcode
      @barcode = CodhabBarcode::Barcode.new({value: self.value, deadline: self.deadline.strftime('%d/%m/%Y'), unique_code: self.id})
      BankSlip.find(self.id).update(barcode: @barcode.block_no_formated_full)
    end

  end
end
