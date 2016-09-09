## gestão de documentos - histórias de usuário

### 2. Gestão de remessas
#### 2.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de remessas

> permissões

    * visualização
    * criar e editar
    * excluir
    * enviar remessa
    * devolver remessa

> filtros

    *filtrar por [descrição, status, data de criação]

> validações

    *[descrição] não podem estar em branco
    *documentos somente podem ser inseridos na remessa antes do envio
    *a remessa só pode ser editar e ou excluida antes do envio

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

#### 2.2 realizar inclusão e exclusão unitária de documentos
> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * incluir
    * excluir

> validações

    *a carga do documento precisar estar no setor do usuário que está fazendo o tramite

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
