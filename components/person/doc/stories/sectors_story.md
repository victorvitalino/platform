## gestão de pessoas - histórias de usuário

### 1. Gestão de setores
#### 1.1 listagem, cadastro, edição, exclusão, inclusão e exclusão de ramais
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar e editar
    * excluir
    * inclusão e exclusão de ramal

> filtros

    *filtrar por [nome, status]

> validações

    *[nome, sigla e prefixo] não podem estar em branco
    *[nome,prefixo] devem ser únicos

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

> Operações

    *quando houver hierarquia cadastrar setor pai. designar responsável pelo setor.
    *cadastrar ramais do setor.
