## gestão de empresas - histórias de usuário

### 1. Gestão de endereços
#### 1.1 vincular e ou desvincular candidato por reserva ou venda
> contexto

    * usuário com permissão realiza gestão de endereços

> permissões

    * visualização
    * alteração de situação


> filtros

    *filtrar por [nome, cpf, endereço, situação do imóvel]

> validações

    *[status] só permitir venda para candidato com reserva

> retornos

    *se :sucesso retornar para listagem e emitir mensagem de sucesso
    *se :erro    retornar para formulário e emitir erros no formulário
