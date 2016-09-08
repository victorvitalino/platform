## gestão de projetos habitacionais - histórias de usuário

### 4. Gestão de empreendimentos
#### 4.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, tipologia, status]

> validações

    *[nome, tipologia] não podem estar em branco
    *[cnpj] deve ser único

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
