## gestão de documentos - histórias de usuário

### 3. Gestão de tipos de documento
#### 3.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de tipos de documento

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [nome, status]

> validações

    *[nome] não podem estar em branco
    *[nome, prefixo] devem ser únicos

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
