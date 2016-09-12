## gestão de acompanhamento jurídico - histórias de usuário

### 1. Gestão de acompanhamento jurídico
#### 1.1 listagem, cadastro, edição, exclusão
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar e editar
    * excluir
    * fechar acompanhamento

> filtros

    *filtrar por [Processo, orgão, tipo de acompanhamento, tipo de ação, advogado responsável, status, data de inclusão]

> validações

    *[processo, orgão, tipo de ação, instancia] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

#### 1.2 inclusão e exclusão de autor da causa
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar
    * excluir    

> validações

    *[nome] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário

#### 1.3 inclusão e exclusão de réu da causa
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar
    * excluir    

> validações

    *[nome] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
