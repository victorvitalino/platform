## gestão de núcleo - histórias de usuário

### 6. Gestão de sub menus
#### 6.1 listagem, cadastro, edição, exclusão
> contexto

    * usuário com permissão realiza gestão de setores

> permissões

    * visualização
    * criar e editar
    * excluir


> validações

    *[nome, code, nav] não podem estar em branco

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
