## gestão de empresas - histórias de usuário

### 1. Gestão de usuários
#### 1.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de usuários

> permissões

    * visualização
    * cadastro, edição e exclusão


> filtros

    *filtrar por [nome, cpf]

> validações

    *[nome, login] não podem ficar em branco
    *[login] deve ser único

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
