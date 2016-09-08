## gestão de projetos habitacionais - histórias de usuário

### 3. Gestão de tipologias
#### 3.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, renda]

> validações

    *[nome, tipo, area, renda familiar, valor inicial, valor final] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
