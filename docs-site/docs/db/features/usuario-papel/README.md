---
title: Usuario-Papel
---

# Feature: Usuario-Papel

Tabela de associacao N:N entre usuario e papel.

## Tabela usuario_papel

| Coluna | Tipo | Descricao |
|--------|------|-----------|
| usuario_id | UUID | FK para usuario |
| papel_id | UUID | FK para papel |

Chave primaria composta: (usuario_id, papel_id).

## Script SQL

``db/init/04-tables-usuario-papel.sql``

