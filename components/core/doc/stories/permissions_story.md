## gestão de núcleo - histórias de usuário

### 4. Gestão de permissões
#### 4.1 listagem, cadastro, edição, exclusão
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar
    * excluir


> validações

    *[system, action, staff] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
