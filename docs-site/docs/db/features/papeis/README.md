---
title: Papeis
---

# Feature: Papeis

Armazena os papeis (roles) do sistema.

## Tabela papeis

| Coluna | Tipo | Descricao |
|--------|------|-----------|
| id | UUID | Chave primaria |
| nome | TEXT | Nome do papel |
| created_at | TIMESTAMPTZ | Data de criacao |
| updated_at | TIMESTAMPTZ | Data de atualizacao |

## Script SQL

``db/init/03-tables-papeis.sql``

