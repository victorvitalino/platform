## gestão de endereços - histórias de usuário

### 1. Gestão de estados
#### 1.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de estados

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, sigla]

> validações

    *[nome, sigla] não podem estar em branco
    *[nome,sigla] devem ser únicos

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
