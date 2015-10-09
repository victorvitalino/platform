require 'csv'

namespace :candidate do
  desc "migração Cadastros"
  task :cadastres => :environment do
    @index = 0
    CSV.foreach("lib/files/candidatos_2.csv", :col_sep => ",") do |row|
      @index += 1

      #if @index > 300_000
        @cadastre = Candidate::Cadastre.new({
          name: row[0].to_s.strip.upcase,
          cpf:  row[1].to_s.strip,
          seqcad_id: row[2],
          born: row[3],
          born_uf: row[4].to_s.strip,
          rg: row[5],
          gender: row[6],
          #rg_org: row[7], #ROW[7]
          #rg_uf: row[8].to_s.gsub('/',''),
          arrival_df: row[8],
          telephone: row[9],
          telephone_optional: row[10],
          celphone: row[11],
          email: row[12],
          special_condition_id: row[13],
          cep: row[14], 
          city_id: row[15],
          address: row[16],
          income: row[17],
          work_address: row[18],
          work_city_id: row[19],
          nis: row[20],
          cid: row[21],
          civil_state_id: row[22],
          program_id: row[23],
          adapted_property: row[24],
          date_old_cadastre: row[25]
        })

        begin
          if @cadastre.save
            @cadastre_mirror = Candidate::CadastreMirror.new({
              name: @cadastre.name,
              cpf:  @cadastre.cpf,
              born: @cadastre.born,
              gender: @cadastre.gender,
              born_uf: @cadastre.born_uf,
              rg: @cadastre.rg,
              arrival_df: @cadastre.arrival_df,
              telephone: @cadastre.telephone,
              telephone_optional: @cadastre.telephone_optional,
              celphone: @cadastre.celphone,
              email: @cadastre.email,
              special_condition_id: @cadastre.special_condition_id,
              cep: @cadastre.cep, 
              city_id: @cadastre.city_id,
              address: @cadastre.address,
              income: @cadastre.income,
              work_address: @cadastre.work_address,
              work_city_id: @cadastre.work_city_id,
              nis: @cadastre.nis,
              cid: @cadastre.cid,
              civil_state_id: @cadastre.civil_state_id,
              program_id: @cadastre.program_id,
              adapted_property: @cadastre.adapted_property,
              cadastre_id: @cadastre.id
            })

            @cadastre_mirror.save
          else
            @ruim = Ruim.new({
              name: @cadastre.name,
              cpf: @cadastre.cpf,
              seqcad: @cadastre.seqcad_id,
              motivo: 'cpf invalido',
              type_scope: 'candidatos 2'
            })

           @ruim.save
          end
        rescue Exception => e
          @ruim = Ruim.new({
            name: @cadastre.name,
            cpf: @cadastre.cpf,
            seqcad: @cadastre.seqcad_id,
            motivo: e,
            type_scope: 'candidatos 2'
          })
          @ruim.save
        end
        puts @index

      
    end
  end
end