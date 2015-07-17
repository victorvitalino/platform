namespace :permissions do
  
  desc "Migração de permissões de usuário"
  task :migrate => :environment do
  
		

		#-------------------------------------------HELPDESK------------------------------------------------------
		@system_helpdesk = Person::System.new(name: 'Helpdesk',code: 2, status: true)
		@system_helpdesk.save

		#criação da permissões de controller order_service
		@system_permission = Person::SystemPermission.create([
		  { action: "Ordem de Serviço - criar/editar", 	    code: 2101, status: true, system_id: @system_helpdesk.id },
		  { action: "Ordem de Serviço - excluir", 					code: 2102, status: true, system_id: @system_helpdesk.id },
		  { action: "Ordem de Serviço - visualizar",				code: 2103, status: true, system_id: @system_helpdesk.id },
		  { action: "Usuário",															code: 2104, status: true, system_id: @system_helpdesk.id },
		  { action: "Técnico",															code: 2105, status: true, system_id: @system_helpdesk.id }
		])
		#criação da permissões de controller monitor_service_order
		@system_permission = Person::SystemPermission.create([
		  { action: "Acompanhamento de Chamado - criar/editar", 	  code: 2201, status: true, system_id: @system_helpdesk.id },
		  { action: "Acompanhamento de Chamado - excluir", 					code: 2202, status: true, system_id: @system_helpdesk.id },
		  { action: "Acompanhamento de Chamado - visualizar",				code: 2203, status: true, system_id: @system_helpdesk.id },
		  { action: "Assumir   Chamado - visualizar",								code: 2204, status: true, system_id: @system_helpdesk.id },
		  { action: "Finalizar Chamado - visualizar",								code: 2205, status: true, system_id: @system_helpdesk.id }
		])

		@user = Person::Staff.find_by_code('dev001')

		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 1 , status: true},
			{staff_id: @user.id , system_permission_id: 2 , status: true},
			{staff_id: @user.id , system_permission_id: 3 , status: true},
			{staff_id: @user.id , system_permission_id: 4 , status: true},
			{staff_id: @user.id , system_permission_id: 5 , status: true}
		])
		@permission_user = Person::StaffPermission.create([
			{staff_id: @user.id , system_permission_id: 6 , status: true},
			{staff_id: @user.id , system_permission_id: 7 , status: true},
			{staff_id: @user.id , system_permission_id: 8 , status: true},
			{staff_id: @user.id , system_permission_id: 9 , status: true},
			{staff_id: @user.id , system_permission_id: 10 , status: true}
		])

	end
end
