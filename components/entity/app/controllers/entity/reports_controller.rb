require_dependency 'entity/application_controller'
module Entity
  class ReportsController < ApplicationController

    def index
      authorize :report, :index?
      
      @entities = Entity::Cadastre.all
      @notsend =  @entities.count - @entities.senders.count
      @news = Entity::Cadastre.joins("left join entity_olds on entity_olds.cnpj = entity_cadastres.cnpj and old = 'Credenciada'").where("entity_olds.cnpj is null")
      @process = Entity::Cadastre.joins("inner join protocol_assessments on protocol_assessments.cnpj = entity_cadastres.cnpj").where("year = 2016 and document_type_id = 1 and subject_id = 1665")

      @olds = @entities.count - @news.count
  end

  end
end
