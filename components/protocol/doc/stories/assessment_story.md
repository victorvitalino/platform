## gestão de documentos - histórias de usuário

### 1. Gestão de documentos
#### 1.1 listagem, cadastro, edição e exclusão
> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * visualização
    * criar e editar
    * excluir

> filtros

    *filtrar por [documento, cpf, tipo de documento, Assunto, sector, interessado]

> validações

    *[tipo de documento, unidade solicitante, assunto] não podem estar em branco
    *[número do documento] deve ser único por tipo de documento
    *[cpf, cnpj] precisa ser válido

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

> Operações

    *na criação o número do documento e gerado automaticamente pelo sistema. padrão
    3 primeiros digitos prefixo do setor (exceto: processo => 392, requerimento externo => 777)
    6 digitos do meio numeração sequencial
    4 últimos digitos ano.

### 1.2 inclusão e exclusão de documento digitalizado

> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * criar
    * excluir

> validações

    *[arquivo] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

### 1.3 inclusão de documento anexado/apensado

> contexto

    * usuário com permissão realiza gestão de funcionários

> permissões

    * inclusão

> validações

    *não pode estar anexado em outro processo
    *a carga do documento precisa estar no setor do usuário

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
