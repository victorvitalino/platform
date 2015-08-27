require_dependency 'application_controller'
require 'codhab_billing'

module Finance
  class PaymentGuide < ActiveRecord::Base
    belongs_to :type_guide

    enum model_guide: [:recolhimento, :boleto]

    validates_presence_of :type_guide, :deadline, :name, :model_guide
    validates :value, numericality: {only_float: true}, allow_blank: true
    validates_date :deadline, after: Date.today - 1.day
    validates :cpf, cpf: true, presence: true
    
    before_create :set_value

    def self.search(search)
      query =  PaymentGuide.where(created_at: Date.parse(search[:start])..Date.parse(search[:end]))
      query =  query.where("type_guide_id = #{search[:type]}")                                     if search[:type].present?
      query =  query.where("status = #{(search[:status] == 'pago') ? true : false}")              if search[:status].present?
      query
    end

    def protocol
      "CODHAB#{self.id}#{self.created_at.strftime('%d%m%Y')}"
    end

    private

    def set_value
      if !self.value.present?
        self.value = type_guide.value
      end
    end

  end
end
