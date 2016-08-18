module Sefaz
  class Allotment < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :send_status
    belongs_to :send_staff, class_name: "Person::Staff"

    has_many :exemptions

    enum exemption_type: {itbi: 1, itcd: 2}
    enum send_type: ["cancelamento parcial", "pedido de isenção","cancelamento total"]

    validates :exemption_type,  presence: true
    validates :notifiers,  presence: true
    validates :cnpj_notifiers, presence: true, cnpj: true, numericality: true
    validates :observation, presence: true, if: 'send_type != 1'


    scope :protocolo, -> (protocolo) {where(protocol_return: protocolo)}
    scope :date_create, -> (date_create) {where("created_at::date = to_date(?, 'dd/MM/YYYY')", date_create)}
    scope :notifiers, -> (notifiers) {where(notifiers: notifiers)}
    scope :send_status, -> (send_status) {where(send_status_id: send_status)}
    scope :send_type, -> (send_type) {where(send_type: send_type)}
    scope :cpf, -> (cpf) {joins(:exemptions).where('sefaz_exemptions.cpf = ?',cpf)}

    def self.current_sector(current_user)
      current_sector_id = current_user.sector_current_id

      if current_user.administrator?
        sector_id  = Person::Sector.status(true).map(&:id)
      else
        sector_id  = Person::Sector.status(true).where(father_id: current_sector_id).map(&:id)
        sector_id  << current_sector_id
      end

      current_sector_id = (sector_id.present?) ? sector_id : current_sector_id
      self.all.joins(:staff).where('person_staffs.sector_current_id in (?)', current_sector_id)
    end

    def self.process(allotment_id)

      allotment = Sefaz::Allotment.find(allotment_id)

      set_client
      message = { "num_protocolo"  => allotment.protocol_return.to_s }

      @response = @client.call(:consulta_protocolo, message: message )

      process = @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:ok]

      if process
        result = @response.hash[:envelope][:body][:consulta_protocolo_response][:consulta_protocolo_result][:detalhe_protocolo_][:detalhe_protocolo]

       if result.count == 5
         cpf = result[:cpf_adquirente]
         @candidate = allotment.exemptions.find_by_cpf(cpf) rescue nil

         if @candidate.present?
           @candidate.act_number = result[:num_ato_declaratorio]
           @candidate.return_message = result[:msg_ret]

           @candidate.save
         end
       else
         result.each do |r|
           cpf = r[:cpf_adquirente]
           @candidate = allotment.exemptions.find_by_cpf(cpf) rescue nil

           if @candidate.present?
             @candidate.act_number = r[:num_ato_declaratorio].to_s
             @candidate.return_message = r[:msg_ret].to_s
             @candidate.save

           end
         end
       end
       allotment.update(send_status_id: 4)
        return true
       else
 				return false
 			end
    end

    def self.send_allotment(allotment_id, user)
      allotment = Sefaz::Allotment.find(allotment_id)

      @xml = Sefaz::Exemption.xml(allotment.id)

      alltoment = Sefaz::Allotment.find(allotment_id)

      set_client
      message = { "imoveis_xml"  => @xml, "tpImposto" =>  alltoment.exemption_type.upcase}

      result = @client.call(:receber_inf_imovel_construido, message: message)
      protocol = result.hash[:envelope][:body][:receber_inf_imovel_construido_response][:receber_inf_imovel_construido_result][:protocolo]

      alltoment.update(send_status_id: 3, send_date: DateTime.now, send_staff_id: user, protocol_return: protocol)

    end

    def self.send_parcial_cancelation(allotment_id, user)
      allotment = Sefaz::Allotment.find(allotment_id)

      @xml = Sefaz::Exemption.xml_parcial(allotment.id)

      alltoment = Sefaz::Allotment.find(allotment_id)

      set_client

      message = { "cancelamentParcial_xml"  => @xml}

      result = @client.call(:receber_inf_cancelamento_parcial, message: message)

      protocol = result.hash[:envelope][:body][:receber_inf_cancelamento_parcial_response][:receber_inf_cancelamento_parcial_result][:protocolo]

      alltoment.update(send_status_id: 3, send_date: DateTime.now, send_staff_id: user, protocol_return: protocol)

    end

    def self.send_total_cancelation(allotment_id, user)
      allotment = Sefaz::Allotment.find(allotment_id)

      @xml = Sefaz::Exemption.xml_total(allotment.id)

      alltoment = Sefaz::Allotment.find(allotment_id)

      set_client
      message = { "cancelamentoTotal_xml"  => @xml}

      result = @client.call(:receber_inf_cancelamento_total, message: message)
      protocol = result.hash[:envelope][:body][:receber_inf_imovel_construido_response][:receber_inf_imovel_construido_result][:protocolo]

      alltoment.update(send_status_id: 3, send_date: DateTime.now, send_staff_id: user, protocol_return: protocol)

    end

    private

    def self.set_client
				@client = Savon.client(wsdl: 'http://publica.agencianet.fazenda.df.gov.br/codhab/ConsessaoImovel.asmx?wsdl',namespace: nil,encoding: "UTF-8", env_namespace: :soap,open_timeout: 900,read_timeout:900)
		end

  end
end
