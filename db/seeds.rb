@staff = Person::Staff.new(
	email: 'dev@codhab.df.gov.br',
  name: 'Developer',
	cpf: '47579915251',
	rg: '0000001',
	rg_org: 'ssp df',
	code: 'dev001',
	born: '01/01/1990'
)

@staff.build_user

@staff.user.username = "dev001"
@staff.user.password = "123456789"
@staff.user.password_confirmation = "123456789"

@staff.save!