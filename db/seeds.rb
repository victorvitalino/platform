@staff = Person::Staff.new(
  email: 'dev@codhab.df.gov.br',
  name: 'Developer',
  cpf: '47579915251',
  rg: '0000001',
  rg_org: 'ssp df',
  code: 'dev001',
  born: '01/01/1990',
  administrator: true
)

@staff.build_user

@staff.user.username = "dev001"
@staff.user.password = "123456789"
@staff.user.password_confirmation = "123456789"

@staff.save!

=begin

PARA TESTAR O ATENDIMENTO DE REGULARIZACAO 

@program = Candidate::Program.create([
  {name: "regularização", code: 1, status: true },
  {name: "habitação", code: 2, status: true }
])

@status  = Candidate::AttendanceStatus.create({
    name: "atendimento iniciado", code: 1
  }) 
@status  = Candidate::AttendanceStatus.create({
    name: "preenchimento de checklist", code: 4
}) 
=end
