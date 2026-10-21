---
title: Comandos
---

# Cheat Sheet de Comandos

## Subir o ambiente

```bash
docker compose up -d
```

## Verificar logs

```bash
docker compose logs postgres
```

## Acessar o banco

```bash
docker exec -it calculo_st_postgres psql -U admin -d calculo_st_db
```

