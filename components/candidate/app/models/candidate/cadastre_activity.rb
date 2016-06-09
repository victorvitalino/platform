module Candidate
  class CadastreActivity < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :staff
    belongs_to :activity_status

    enum type_activity:   ['simples', 'judicial','crítico', 'corretiva', 'sistema']
    enum type_ocurrency:  ['impeditivo', 'informativo', 'corretivo']

    def self.create_simple_log!(options = {})
      cadastre_id        = options[:cadastre_id] ||= nil
      staff_id           = options[:staff_id] ||= nil
      activity_status_id = options[:activity_status_id] ||= nil
      type_activity      = options[:type_activity] ||= nil
      status             = options[:status] ||= nil
      type_ocurrency     = options[:type_ocurrency] ||= nil
      observation        = options[:observation] ||= nil
      cadastre_mirror_id = options[:cadastre_mirror_id] ||= nil


      object = self.new
      object.cadastre_id = cadastre_id
      object.staff_id = staff_id
      object.activity_status_id = activity_status_id
      object.type_activity = type_activity
      object.status = status
      object.type_ocurrency = type_ocurrency
      object.observation = observation
      object.cadastre_mirror_id = cadastre_mirror_id

      object.save
    end

  end
end
