require 'csv'

namespace :csv do
  desc "migração csv"

  task :entidade => :environment do 
    
    Entity::DocumentCategory.create([
    { name: "Comprovante de inscrição e de situação cadastral CNPJ", code: 1, status: true},
    { name: "Estatuto ou contrato social registrado", code: 2, status: true},
    { name: "Ata de fundação e de eleição da atual diretoria", code: 3, status: true},
    { name: "Relação nominal atualizada dos dirigentes", code: 4, status: true},
    { name: "Comprovante de regularidade com a Fazenda Federal", code: 5, status: true},
    { name: "Comprovante de regularidade com a Fazenda Estadual", code: 6, status: true},
    { name: "Comprovante de regularidade com a Fazenda Municipal", code: 7, status: true},
    { name: "Comprovante de regularidade como o FGTS", code: 8, status: true},
    { name: "Comprovante de regularidade com o INSS", code: 9, status: true},
    { name: "Declaração atestando a inexistência de dívida com o Poder Público", code: 10, status: true},
    { name: "Declaração atestando que nenhuma das pessoas relacionadas é agente político ou do ministério público", code: 11, status: true},
    { name: "Regularidade com o CADIN", code: 12, status: true},
    { name: "Regularidade com a ações trabalhistas", code: 13, status: true}
    ])

  end

  task :treta => :environment do
    @index = 0
    CSV.foreach("lib/files/pontuationrie.csv", :col_sep => "#") do |row|
      @index += 1

       @ref = Candidate::Pontuation.new({
          cadastre_id: row[0],
          cadastre_mirror_id: row[0],
          code: row[7],
          bsb: row[1],
          dependent: row[2],
          timelist: row[3],
          special_condition: row[4],
          income: row[5],
          total: row[6],
          program_id: 2
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