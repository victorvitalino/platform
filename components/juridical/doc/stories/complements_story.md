## gestão de acompanhamento jurídico - histórias de usuário

### 2. Gestão de complemento de acompanhamento juridico
#### 2.1 listagem, cadastro, edição, exclusão
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar e editar
    * excluir


> validações

    *[tipo de documento, data de distribuição, advogado responsável, status, tipo de acompanhamento] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
