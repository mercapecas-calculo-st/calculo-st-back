---
title: NCM-ST
---

# Feature: NCM-ST

Cadastro de NCMs e regras de Substituicao Tributaria.

## Tabela ncm_st

| Coluna | Tipo | Descricao |
|--------|------|-----------|
| id | UUID | Chave primaria |
| ncm | TEXT | Codigo NCM (CHECK) |
| cest | TEXT | Codigo CEST (CHECK) |
| tipo | TEXT | RAIZ ou DERIVADO |
| mva | NUMERIC | Margem de Valor Agregado |
| created_at | TIMESTAMPTZ | Data de criacao |
| updated_at | TIMESTAMPTZ | Data de atualizacao |

## Regras (CHECK)

- Formato de NCM validado.
- Formato de CEST validado.
- Tipo restrito a RAIZ ou DERIVADO.

## Script SQL

``db/init/06-tables-ncm-st.sql``

