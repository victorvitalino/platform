module Address
  class Unit < ActiveRecord::Base
    belongs_to :situation_unit
    belongs_to :city
    belongs_to :enterprises, class_name: "Project::Enterprise", foreign_key: 'project_enterprise_id'
    has_many :registry_units
    has_many :notary_offices
    has_many :cadastre_address, class_name: "Candidate::CadastreAddress"
    has_many :cadastres, through: :cadastre_address, class_name: "Candidate::Cadastre"
    has_many :ammvs, class_name: "Candidate::Ammv", foreign_key: 'unit_id'

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


    def set_color(in_unit, cdru)
      return "blue" if in_unit.nil?
      case cdru 
        when "SIM"
          'green'
        when '4º Termo Aditivo'
          'yellow'
        when 'Migrado sem autorização e Não possui cadastro na CODHAB' 
          'red'
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
