module Address
  class Unit < ActiveRecord::Base
    belongs_to :situation_unit
    belongs_to :city
    belongs_to :enterprises, class_name: "Project::Enterprise", foreign_key: 'project_enterprise_id'
    has_many :registry_units
    has_many :notary_offices
    has_many :cadastre_address, class_name: "Candidate::CadastreAddress"
    has_many :cadastres, through: :cadastre_address, class_name: "Candidate::Cadastre"
    has_many :ammvs, class_name: "Candidate::Ammv"

    scope :address, -> (address) {where("complete_address ILIKE ?", "%#{address}%")}
    scope :status, -> (status) {where(situation_unit_id: status)}

    scope :city, -> (city) {where(city_id: city)}
    scope :block, -> (block) {where(block: block)}
    scope :group_address, -> (group_address) {where(group: group_address)}
    scope :unit, -> (unit) {where(unit: unit)}

    scope :regularization, -> {where("urb not in ('ETAPA 4C','MORARBEM','H4')")}

    scope :situation_unit, -> (situation_unit) {where(situation_unit_id: situation_unit)}
    scope :cpf, -> (cpf) {joins(cadastre_address: :cadastre).where("candidate_cadastres.cpf = ?", cpf)}
    scope :process_number, -> (process_number) {search_process(process_number)}
    scope :name_candidate, -> (name_candidate) {joins(cadastre_address: :cadastre).where("candidate_cadastres.name ILIKE ?","#{name_candidate}%")}


    def dweller
      object_ammvs      = self.ammvs.last
      object_cadastre   = self.cadastres.last

      if object_ammvs.present?
        object_ammvs
      elsif object_cadastre.present?
        object_cadastre
      else
        nil
      end
    end

    def dweller_name
      return "Sem informação" if dweller.nil?
      dweller.name.upcase
    end

    def dweller_cpf
      return "Sem informação" if dweller.nil?
      dweller.cpf
    end


    def date_tcu 
      last_cadastre_address = self.cadastre_address.last
      if last_cadastre_address.present?
        last_cadastre_address.created_at.strftime("%d/%m/%Y")
      else
        nil
      end
    end

    def ammvs_cdru
      cdru_ammvs = self.ammvs.last
      cadastre   = self.cadastres.last

      return "Imóvel vago" if cdru_ammvs.nil? && cadastre.nil?
      
      tcu = Date.parse(date_tcu) rescue nil
      
      if cdru_ammvs.present? && cdru_ammvs.cdru == "SIM"
        "Incluso na CDRU" 
      else
        return "Não possui cadastro na CODHAB" if cadastre.nil?
        not_present_cdru(tcu)
      end
    end

    def ammvs_cdru_observation
      cdru_ammvs = self.ammvs.last
      cdru_ammvs.present? ? cdru_ammvs.cdru_observation.downcase : "Sem informação"
    end

    def ammvs_finance_agent
      cdru_ammvs = self.ammvs.last
      return "Sem informação" if cdru_ammvs.nil?
      cdru_ammvs.finance_agent
    end

    def not_present_cdru(tcu)
      if tcu.present?
        if tcu >= Date.parse('05/05/2016')
          "4º Termo Aditivo"
        elsif tcu < Date.parse('05/05/2016')
          "Migrado sem autorização"
        end
      else
        "Sem informação"
      end
    end

    def set_color
      case self.ammvs_cdru
      when 'Incluso na CDRU'
        'success'
      when '4º Termo Aditivo'
        'danger'
      when 'Migrado sem autorização'
        'danger'
      when 'Não possui cadastro na CODHAB'
        'danger'
      when 'Imóvel vago'
        'primary'
      when 'black'
        'black'
      end
    end

   def candidate_in_unit
    ammvs = ammvs_candidate
    if ammvs.present?
      ammvs_candidate
    else
      unit = Candidate::CadastreAddress.where(unit_id: self.id).order('created_at').last rescue nil
      return false if unit.nil?
      Candidate::Cadastre.find(unit.cadastre_id)
    end
   end

   def self.json(address)
    data = Array.new

    address.order(:complete_address).each do |addr|
      data << {
        coordinate: addr.coordinate.split(','),
        complete_address: addr.complete_address,
        unit: addr.unit,
        name: addr.dweller_name,
        cpf:  addr.dweller_cpf,
        cpf_formated: (addr.dweller_cpf != "Sem informação") ? addr.dweller_cpf.format_cpf : "",
        tcu:  addr.date_tcu.present? ? addr.date_tcu : "Sem informação",
        color: addr.set_color,
        cdru: addr.ammvs_cdru,
        cdru_observation: addr.ammvs_cdru_observation
      }
    end

    data
   end

   private

   def ammvs_candidate
    Candidate::Ammv.find_by_unit_id(self.id) rescue false
   end

   def self.search_process(process_number)
     @procedural = Candidate::CadastreProcedural.where(old_process: process_number).last
     if @procedural.present?
       @unit = Address::Unit.joins(:cadastre_address).where("candidate_cadastre_addresses.cadastre_id = ?", @procedural.cadastre_id)
     end

   end

   def self.update_situation(unit,status)
       @unit = Address::Unit.find(sunit)
       @unit.update(situation_unit_id: status)
   end


  end
end
