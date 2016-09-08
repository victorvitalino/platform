## gestão de pessoas - histórias de usuário

### 1. Gestão de funcionários
#### 1.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, cpf, setor_atual, matrícula, status]

> validações

    *[nome, matrícula, cpf, senha, cargo] não podem estar em branco
    *[matrícula, cpf] não podem já estar em uso
    *[cpf] precisa ser válido

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

> Operações

    *quando cadastro for realizado com :sucesso enviar e-mail informando a criação
    do mesmo cadastro junto aos seus dados para email do suporte técnico.

    *quando cadastro for realizado com :sucesso aplicar template padrão de permissões
    para o cadastro.
