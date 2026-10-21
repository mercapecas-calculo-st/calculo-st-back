---
title: Parametro Tributario
---

# Feature: Parametro Tributario

Parametros base para calculos tributarios (MVA, aliquotas).

## Tabela parametro_tributario

| Coluna | Tipo | Descricao |
|--------|------|-----------|
| id | UUID | Chave primaria |
| descricao | TEXT | Descricao |
| mva | NUMERIC | Margem de Valor Agregado |
| aliquota | NUMERIC | Aliquota |
| created_at | TIMESTAMPTZ | Data de criacao |
| updated_at | TIMESTAMPTZ | Data de atualizacao |

## Script SQL

``db/init/05-tables-parametro-tributario.sql``

