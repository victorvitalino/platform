## gestão de núcleo - histórias de usuário

### 2. Gestão de sistemas
#### 2.1 listagem, cadastro, edição, exclusão
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar e editar
    * excluir


> validações

    *[nome, code, module] não podem estar em branco
    *[nome, code] devem ser únicos

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
