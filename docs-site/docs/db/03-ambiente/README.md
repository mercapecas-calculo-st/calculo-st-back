---
title: Ambiente
---

# Configuracao de Ambiente

O arquivo ``.env`` na raiz do projeto e lido pelo ``docker-compose.yml``.

## Conteudo do .env

```env
POSTGRES_USER=admin
POSTGRES_PASSWORD=9709@db
POSTGRES_DB=calculo_st_db
```

## Nota Importante

> O usuario do banco (admin) e diferente do usuario do sistema
> (administrador criado no seed).

