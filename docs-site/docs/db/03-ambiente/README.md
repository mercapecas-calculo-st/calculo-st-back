---
title: Ambiente
---

# Configuracao de Ambiente

O arquivo ``.env`` na raiz do projeto e lido pelo ``docker-compose.yml``.

## Conteudo 

crie o .env baseado no .env.exemple e substitua o campo de senha por uma senha de sua escolha. 

```.env.exemple
POSTGRES_USER=postgres
POSTGRES_PASSWORD=digitar_senha
POSTGRES_DB=db_calc_st
```

## Nota Importante

> O usuario do banco (admin) é diferente do usuario do sistema
> O usuário administrador do sistema é criado no seed como "administrador".

