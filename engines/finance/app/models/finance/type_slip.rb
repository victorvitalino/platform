module Finance
  class TypeSlip < ActiveRecord::Base

    default_scope { where(publish: true) }
    validates_presence_of :title, :value, :code
    validates_uniqueness_of :code, :title

    def name_value
      "#{self.title} - R$ #{self.value}"
    end
  end
end
