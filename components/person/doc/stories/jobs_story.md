## gestão de pessoas - histórias de usuário

### 1. Gestão de cargos
#### 1.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, status]

> validações

    *[nome] não podem estar em branco
    *[nome] deve ser único

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
