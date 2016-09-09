## gestão de projetos habitacionais - histórias de usuário

### 2. Gestão de usuários de empresas
#### 2.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de usuários de empresas

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, cpf]

> validações

    *[nome, login, senha] não podem estar em branco
    *[login] deve ser único

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
