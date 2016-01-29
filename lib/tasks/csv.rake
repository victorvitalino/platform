require 'csv'

namespace :csv do
  desc "migração csv"

  task :entidade => :environment do

    Entity::DocumentCategory.create([
    { name: "Comprovante de inscrição e de situação cadastral CNPJ", document_type: 0, required: true, code: 1, status: true},
    { name: "Estatuto ou contrato social registrado", document_type: 0, required: true, code: 2, status: true},
    { name: "Ata de fundação e de eleição da atual diretoria", document_type: 0, required: true, code: 3, status: true},
    { name: "Relação nominal atualizada dos dirigentes", document_type: 0, required: true, code: 4, status: true},
    { name: "Comprovante de regularidade com a Fazenda Federal", document_type: 0, required: true, code: 5, status: true},
    { name: "Comprovante de regularidade com a Fazenda Estadual", document_type: 0, required: true, code: 6, status: true},
    { name: "Comprovante de regularidade com a Fazenda Municipal", document_type: 0, required: true, code: 7, status: true},
    { name: "Comprovante de regularidade como o FGTS", document_type: 0, required: true, code: 8, status: true},
    { name: "Comprovante de regularidade com o INSS", document_type: 0, required: true, code: 9, status: true},
    { name: "Declaração atestando a inexistência de dívida com o Poder Público", document_type: 0, required: true, code: 10, status: true},
    { name: "Declaração atestando que nenhuma das pessoas relacionadas é agente político ou do ministério público", document_type: 0, required: true, code: 11, status: true},
    { name: "Regularidade com o CADIN", document_type: 0, required: true, code: 12, status: true},
    { name: "Regularidade com a ações trabalhistas", document_type: 0, required: true, code: 13, status: true}
    ])

  end

  task :entidade2 => :environment do

    Entity::DocumentCategory.create([
    { name: "Experiência em processos de autogestão ou gestão habitacional, mensurada por empreendimentos habitacionais", document_type: 1, required: true, code: 11, status: true},
    { name: "Experiência em processos de articulação de projetos habitacionais", document_type: 1, required: false, code: 12, status: true},
    { name: "Experiência em elaboração e desenvolvimento de projetos habitacionais", document_type: 1, required: false, code: 13, status: true},
    { name: "Existência de equipe, permanente, associada ou contratada pela ENTIDADE, composta por técnicos", document_type: 1, required: true, code: 14, status: true},
    { name: "Ações de capacitação de seus associados nas áreas de gestão participativa", document_type: 1, required: false, code: 15, status: true},
    { name: "Desenvolvimento de atividades de mobilização dos seus associados", document_type: 1, required: false, code: 16, status: true},
    { name: "Ações de difusão de informações referentes à área de atuação e de direito à moradia", document_type: 1, required: false, code: 17, status: true},
    { name: "Participação da ENTIDADE em conselhos, conferências, fóruns ou congressos", document_type: 1, required: false, code: 18, status: true},
    { name: "Participação de membro(s) da ENTIDADE como delegado(s) em conferências", document_type: 1, required: false, code: 19, status: true},
    ])

  end

  task :treta => :environment do
    @index = 0


    CSV.foreach("lib/files/log_empresa.csv", :col_sep => "#") do |row|
      @index += 1

      @ref = Firm::EnterpriseStatus.new({
        cadastre_id: row[0],
        status_cadastre_id: row[1],
        observation: row[3],
        archive_file: row[4],
        created_at: row[5],
        enterprise_id: row[1]
      })

      begin
        @ref.save
        #puts @ref.inspect
        puts @index
      rescue Exception => e
        puts e
      end

    end
  end
end