## gestão de endereços - histórias de usuário

### 1. Gestão de cidades
#### 1.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de cidades

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, estado]

> validações

    *[nome, estado] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
