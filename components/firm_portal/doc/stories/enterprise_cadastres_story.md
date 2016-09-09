## gestão de empresas - histórias de usuário

### 1. Gestão de indicados
#### 1.1 listagem, visualização dos dados, alteração de situção
> contexto

    * usuário com permissão realiza gestão de indicados

> permissões

    * visualização
    * alteração de situação


> filtros

    *filtrar por [nome, cpf, situação]

> validações

    *[status] em caso de desistencia é necessário anexar documento

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
