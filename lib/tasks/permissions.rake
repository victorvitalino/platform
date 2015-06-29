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

		@user = Person::Staff.find_by_code('dev001')


		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 1 , status: true},
			{staff_id: @user.id , system_permission_id: 2 , status: true},
			{staff_id: @user.id , system_permission_id: 3 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 4 , status: true},
			{staff_id: @user.id , system_permission_id: 5 , status: true},
			{staff_id: @user.id , system_permission_id: 6 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 7 , status: true},
			{staff_id: @user.id , system_permission_id: 8 , status: true},
			{staff_id: @user.id , system_permission_id: 9 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 10 , status: true},
			{staff_id: @user.id , system_permission_id: 11 , status: true},
			{staff_id: @user.id , system_permission_id: 12 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 13 , status: true},
			{staff_id: @user.id , system_permission_id: 14 , status: true},
			{staff_id: @user.id , system_permission_id: 15 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 16 , status: true},
			{staff_id: @user.id , system_permission_id: 17 , status: true},
			{staff_id: @user.id , system_permission_id: 18 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 19 , status: true},
			{staff_id: @user.id , system_permission_id: 20 , status: true},
			{staff_id: @user.id , system_permission_id: 21 , status: true}
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

		@user = Person::Staff.find_by_code('dev001')


		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 22 , status: true},
			{staff_id: @user.id , system_permission_id: 23 , status: true},
			{staff_id: @user.id , system_permission_id: 24 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 25 , status: true},
			{staff_id: @user.id , system_permission_id: 26 , status: true},
			{staff_id: @user.id , system_permission_id: 27 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 28 , status: true},
			{staff_id: @user.id , system_permission_id: 29 , status: true},
			{staff_id: @user.id , system_permission_id: 30 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 31 , status: true},
			{staff_id: @user.id , system_permission_id: 32 , status: true},
			{staff_id: @user.id , system_permission_id: 33 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 34 , status: true},
			{staff_id: @user.id , system_permission_id: 35 , status: true},
			{staff_id: @user.id , system_permission_id: 36 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 37 , status: true},
			{staff_id: @user.id , system_permission_id: 38 , status: true},
			{staff_id: @user.id , system_permission_id: 39 , status: true}
		])
	end
end
