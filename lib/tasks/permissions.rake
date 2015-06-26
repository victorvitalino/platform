namespace :permissions do
  
  desc "Migração de permissões de usuário"
  task :migrate => :environment do
  
		
		@system = Person::System.new(name: 'Gestão de Pessoas',code: 1, status: true)
		@system.save

		#criação da permissões do controller branch_lines
		@system_permission = Person::SystemPermission.create([
		  { action: "Ramal - criar/editar", 	 	code: 1101, status: true, system_id: @system.id },
		  { action: "Ramal - excluir", 					code: 1102, status: true, system_id: @system.id },
		  { action: "Ramal - visualizar",				code: 1103, status: true, system_id: @system.id }
		])
		#criação da permissões do controller jobs
		@system_permission = Person::SystemPermission.create([
		  { action: "Cargo - criar/editar", 	 	code: 1201, status: true, system_id: @system.id },
		  { action: "Cargo - excluir", 					code: 1202, status: true, system_id: @system.id },
		  { action: "Cargo - visualizar",				code: 1203, status: true, system_id: @system.id }
		])
		#criação da permissões do controller sectors
		@system_permission = Person::SystemPermission.create([
		  { action: "Setor - criar/editar", 	 	code: 1301, status: true, system_id: @system.id },
		  { action: "Setor - excluir", 					code: 1302, status: true, system_id: @system.id },
		  { action: "Setor - visualizar",				code: 1303, status: true, system_id: @system.id }
		])
	  #criação da permissões do controller systems
		@system_permission = Person::SystemPermission.create([
		  { action: "Sistemas - criar/editar", 	 	code: 1401, status: true, system_id: @system.id },
		  { action: "Sistemas - excluir", 				code: 1402, status: true, system_id: @system.id },
		  { action: "Sistemas - visualizar",			code: 1403, status: true, system_id: @system.id }
		])
		#criação da permissões do controller system_permissions
		@system_permission = Person::SystemPermission.create([
		  { action: "Permissões - criar/editar", 	 	code: 1501, status: true, system_id: @system.id },
		  { action: "Permissões - excluir", 				code: 1502, status: true, system_id: @system.id },
		  { action: "Permissões - visualizar",			code: 1503, status: true, system_id: @system.id }
		])
		#criação da permissão do controller users
		@system_permission = Person::SystemPermission.create([
		  { action: "Usuários - criar/editar", 	 	code: 1601, status: true, system_id: @system.id },
		  { action: "Usuários - excluir", 				code: 1602, status: true, system_id: @system.id },
		  { action: "Usuários - visualizar",			code: 1603, status: true, system_id: @system.id }
		])
		#criação da permissões de controller user_permissions
		@system_permission = Person::SystemPermission.create([
		  { action: "Permissões do Usuários - criar/editar", 	 	code: 1701, status: true, system_id: @system.id },
		  { action: "Permissões do Usuários - excluir", 				code: 1702, status: true, system_id: @system.id },
		  { action: "Permissões do Usuários - visualizar",			code: 1703, status: true, system_id: @system.id }
		])


		@user = User.find_by_email('dev@codhab.df.gov.br')


		@permission_user = Person::UserPermission.create([
			{user_id: @user.id , system_permission_id: 1 , status: true},
			{user_id: @user.id , system_permission_id: 2 , status: true},
			{user_id: @user.id , system_permission_id: 3 , status: true}
		])
		@permission_user = Person::UserPermission.create([
			{user_id: @user.id , system_permission_id: 4 , status: true},
			{user_id: @user.id , system_permission_id: 5 , status: true},
			{user_id: @user.id , system_permission_id: 6 , status: true}
		])
		@permission_user = Person::UserPermission.create([
			{user_id: @user.id , system_permission_id: 7 , status: true},
			{user_id: @user.id , system_permission_id: 8 , status: true},
			{user_id: @user.id , system_permission_id: 9 , status: true}
		])
		@permission_user = Person::UserPermission.create([
			{user_id: @user.id , system_permission_id: 10 , status: true},
			{user_id: @user.id , system_permission_id: 11 , status: true},
			{user_id: @user.id , system_permission_id: 12 , status: true}
		])
		@permission_user = Person::UserPermission.create([
			{user_id: @user.id , system_permission_id: 13 , status: true},
			{user_id: @user.id , system_permission_id: 14 , status: true},
			{user_id: @user.id , system_permission_id: 15 , status: true}
		])
		@permission_user = Person::UserPermission.create([
			{user_id: @user.id , system_permission_id: 16 , status: true},
			{user_id: @user.id , system_permission_id: 17 , status: true},
			{user_id: @user.id , system_permission_id: 18 , status: true}
		])
		@permission_user = Person::UserPermission.create([
			{user_id: @user.id , system_permission_id: 19 , status: true},
			{user_id: @user.id , system_permission_id: 20 , status: true},
			{user_id: @user.id , system_permission_id: 21 , status: true}
		])
	end
end
