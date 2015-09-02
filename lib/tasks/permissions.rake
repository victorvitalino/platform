namespace :permissions do

  desc "Migração de permissões de usuário"
  task :migrate => :environment do

		#-------------------------------------------PERSON----------------------------------------------
		@system_person = Person::System.new(name: 'Gestão de Pessoas',code: 1, status: true)
		@system_person.save

		#criação da permissões do controller branch_lines
		@system_permission = Person::SystemPermission.create([
		  { action: "Ramal - criar/editar", 	 	code: 1101, status: true, system_id: @system_person.id },
		  { action: "Ramal - excluir", 					code: 1102, status: true, system_id: @system_person.id },
		  { action: "Ramal - visualizar",				code: 1103, status: true, system_id: @system_person.id }
		])
		#criação da permissões do controller jobs
		@system_permission = Person::SystemPermission.create([
		  { action: "Cargo - criar/editar", 	 	code: 1201, status: true, system_id: @system_person.id },
		  { action: "Cargo - excluir", 					code: 1202, status: true, system_id: @system_person.id },
		  { action: "Cargo - visualizar",				code: 1203, status: true, system_id: @system_person.id }
		])
		#criação da permissões do controller sectors
		@system_permission = Person::SystemPermission.create([
		  { action: "Setor - criar/editar", 	 	code: 1301, status: true, system_id: @system_person.id },
		  { action: "Setor - excluir", 					code: 1302, status: true, system_id: @system_person.id },
		  { action: "Setor - visualizar",				code: 1303, status: true, system_id: @system_person.id }
		])
	  #criação da permissões do controller systems
		@system_permission = Person::SystemPermission.create([
		  { action: "Sistemas - criar/editar", 	 	code: 1401, status: true, system_id: @system_person.id },
		  { action: "Sistemas - excluir", 				code: 1402, status: true, system_id: @system_person.id },
		  { action: "Sistemas - visualizar",			code: 1403, status: true, system_id: @system_person.id }
		])
		#criação da permissões do controller system_permissions
		@system_permission = Person::SystemPermission.create([
		  { action: "Permissões - criar/editar", 	 	code: 1501, status: true, system_id: @system_person.id },
		  { action: "Permissões - excluir", 				code: 1502, status: true, system_id: @system_person.id },
		  { action: "Permissões - visualizar",			code: 1503, status: true, system_id: @system_person.id }
		])
		#criação da permissão do controller users
		@system_permission = Person::SystemPermission.create([
		  { action: "Usuários - criar/editar", 	 	code: 1601, status: true, system_id: @system_person.id },
		  { action: "Usuários - excluir", 				code: 1602, status: true, system_id: @system_person.id },
		  { action: "Usuários - visualizar",			code: 1603, status: true, system_id: @system_person.id }
		])
		#criação da permissões de controller user_permissions
		@system_permission = Person::SystemPermission.create([
		  { action: "Permissões do Usuários - criar/editar", 	 	code: 1701, status: true, system_id: @system_person.id },
		  { action: "Permissões do Usuários - excluir", 				code: 1702, status: true, system_id: @system_person.id },
		  { action: "Permissões do Usuários - visualizar",			code: 1703, status: true, system_id: @system_person.id }
		])


		#----------------------------------------------CMS---------------------------------------------------------------


		@system_cms = Person::System.new(name: 'Gestão do Site',code: 3, status: true)
		@system_cms.save

		#criação da permissões de controller nav_categories
		@system_permission = Person::SystemPermission.create([
		  { action: "Categorias de Menu - criar/editar", 	   	code: 3101, status: true, system_id: @system_cms.id },
		  { action: "Categorias de Menu - excluir", 					code: 3102, status: true, system_id: @system_cms.id },
		  { action: "Categorias de Menu - visualizar",				code: 3103, status: true, system_id: @system_cms.id }
		])
		#criação da permissões de controller nav
		@system_permission = Person::SystemPermission.create([
		  { action: "Menu - criar/editar", 	   	code: 3201, status: true, system_id: @system_cms.id },
		  { action: "Menu - excluir", 					code: 3202, status: true, system_id: @system_cms.id },
		  { action: "Menu - visualizar",				code: 3203, status: true, system_id: @system_cms.id }
		])
		#criação da permissões de controller page_categories
		@system_permission = Person::SystemPermission.create([
		  { action: "Categorias de Páginas - criar/editar", 	  code: 3301, status: true, system_id: @system_cms.id },
		  { action: "Categorias de Páginas - excluir", 					code: 3302, status: true, system_id: @system_cms.id },
		  { action: "Categorias de Páginas - visualizar",				code: 3303, status: true, system_id: @system_cms.id }
		])
		#criação da permissões de controller page
		@system_permission = Person::SystemPermission.create([
		  { action: "Páginas - criar/editar", 	  code: 3401, status: true, system_id: @system_cms.id },
		  { action: "Páginas- excluir", 					code: 3402, status: true, system_id: @system_cms.id },
		  { action: "Páginas - visualizar",				code: 3403, status: true, system_id: @system_cms.id }
		])
		#criação da permissões de controller post
		@system_permission = Person::SystemPermission.create([
		  { action: "Posts - criar/editar", 	  code: 3501, status: true, system_id: @system_cms.id },
		  { action: "Posts - excluir", 					code: 3502, status: true, system_id: @system_cms.id },
		  { action: "Posts - visualizar",				code: 3503, status: true, system_id: @system_cms.id }
		])
		#criação da permissões de controller post_categories
		@system_permission = Person::SystemPermission.create([
		  { action: "Categorias de Posts - criar/editar", 	  code: 3601, status: true, system_id: @system_cms.id },
		  { action: "Categorias de Posts - excluir", 					code: 3602, status: true, system_id: @system_cms.id },
		  { action: "Categorias de Posts - visualizar",				code: 3603, status: true, system_id: @system_cms.id }
		])



		#----------------------------------------------PROTOCOLO---------------------------------------------------------------


		@system_protocolo = Person::System.new(name: 'Protocolo',code: 4, status: true)
		@system_protocolo.save


		@system_permission = Person::SystemPermission.create([
		  { action: "Autuação - criar/editar",		code: 4101, status: true, system_id: @system_protocolo.id },
		  { action: "Autuação - excluir", 				code: 4102, status: true, system_id: @system_protocolo.id },
		  { action: "Autuação - visualizar",			code: 4103, status: true, system_id: @system_protocolo.id }
		])


		@system_permission = Person::SystemPermission.create([
		  { action: "Movimentação - criar/editar",		   code: 4301, status: true, system_id: @system_protocolo.id },
		  { action: "Movimentação - excluir", 				   code: 4302, status: true, system_id: @system_protocolo.id },
		  { action: "Movimentação - visualizar",			   code: 4303, status: true, system_id: @system_protocolo.id },
		  { action: "Movimentação - receber remessa",	   code: 4304, status: true, system_id: @system_protocolo.id },
		  { action: "Movimentação - devolver remessa",   code: 4305, status: true, system_id: @system_protocolo.id },
		  { action: "Movimentação - adicinar documento", code: 4306, status: true, system_id: @system_protocolo.id }
		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Remessas - criar/editar", 	   	code: 4201, status: true, system_id: @system_protocolo.id },
		  { action: "Remessas - excluir", 					code: 4202, status: true, system_id: @system_protocolo.id },
		  { action: "Remessas - visualizar",				code: 4203, status: true, system_id: @system_protocolo.id }

		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Tipo de Documento - criar/editar",	  	code: 4401, status: true, system_id: @system_protocolo.id },
		  { action: "Tipo de Documento - excluir", 					code: 4402, status: true, system_id: @system_protocolo.id },
		  { action: "Tipo de Documento - visualizar",				code: 4403, status: true, system_id: @system_protocolo.id }
		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Assunto - criar/editar", 	  code: 4501, status: true, system_id: @system_protocolo.id },
		  { action: "Assunto - excluir", 					code: 4502, status: true, system_id: @system_protocolo.id },
		  { action: "Assunto - visualizar",				code: 4503, status: true, system_id: @system_protocolo.id }
		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Localização - criar/editar", 	  code: 4601, status: true, system_id: @system_protocolo.id },
		  { action: "Localização - excluir", 					code: 4602, status: true, system_id: @system_protocolo.id },
		  { action: "Localização - visualizar",				code: 4603, status: true, system_id: @system_protocolo.id }
		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Documento Digital - criar/editar", 	  code: 4701, status: true, system_id: @system_protocolo.id },
		  { action: "Documento Digital - excluir", 					code: 4702, status: true, system_id: @system_protocolo.id },
		  { action: "Documento Digital - visualizar",				code: 4703, status: true, system_id: @system_protocolo.id }
		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Anexar Documento - Incluir", 	  				code: 4801, status: true, system_id: @system_protocolo.id },
		  { action: "Apensar Documento - Incluir", 						code: 4802, status: true, system_id: @system_protocolo.id },
		  { action: "Visualizar Anexos/Apensos - visualizar",	code: 4803, status: true, system_id: @system_protocolo.id }
		])

#----------------------------------------------HELPDESK---------------------------------------------------------------


		@system_helpdesk = Person::System.new(name: 'Helpdesk',code: 2, status: true)
		@system_helpdesk.save

		@system_permission = Person::SystemPermission.create([
		  { action: "Ordem de Serviço - abrir/ditar",			code: 2101, status: true, system_id: @system_helpdesk.id },
		  { action: "Ordem de Serviço - excluir", 					code: 2102, status: true, system_id: @system_helpdesk.id },
		  { action: "Ordem de Serviço - visualizar",				code: 2103, status: true, system_id: @system_helpdesk.id }
		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Acompanhamento - incluir/editar", 	   	code: 2201, status: true, system_id: @system_helpdesk.id },
		  { action: "Acompanhamento - excluir", 					code: 2202, status: true, system_id: @system_helpdesk.id },
		  { action: "Acompanhamento - visualizar",				code: 2203, status: true, system_id: @system_helpdesk.id }
		])

		@system_permission = Person::SystemPermission.create([
		  { action: "Atendente - criar/editar", 	  code: 2301, status: true, system_id: @system_helpdesk.id },
		  { action: "Atendente - excluir", 					code: 2302, status: true, system_id: @system_helpdesk.id },
		  { action: "Atendente - visualizar",				code: 2303, status: true, system_id: @system_helpdesk.id },
		  { action: "Atendente - relatórios",				code: 2304, status: true, system_id: @system_helpdesk.id }
		])




	end
end