@user = User.new(
	email: 'dev@codhab.df.gov.br',
	password: '123456789',
	password_confirmation: '123456789',
	name: 'Developer',
	cpf: '47579915251',
	rg: '0000001',
	rg_org: 'ssp df',
	code: 'dev001',
	born: '01/01/1990'
)
@user.save!