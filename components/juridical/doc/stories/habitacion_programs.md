## gestão de acompanhamento jurídico - histórias de usuário

### 5. Gestão de progrmas habitacionais
#### 5.1 listagem, cadastro, edição, exclusão
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar e editar
    * excluir


> validações

    *[nome] não podem estar em branco
    *[nome] deve ser único

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
