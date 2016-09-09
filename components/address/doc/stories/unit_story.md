## gestão de endereços - histórias de usuário

### 1. Gestão de unidades
#### 1.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de unidades

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [cidade, quadra, conjunto, unidade, situação do imóvel, cpf, processo, nome, endereço completo]

> validações

    *[cidade, quadra, conjunto, unidade, situação da unidade]

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

#### 1.2 inclusão e edição de dados do cartório
> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * inclusão e edição


> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
