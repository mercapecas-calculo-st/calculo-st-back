---
title: Parametro Tributario
---

# Feature: Parametro Tributario

Catálogo de parâmetros tributários usados nos cálculos.
Cada parâmetro é identificado por um nome único e possui um valor percentual. 

## Tabela parametro_tributario

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | UUID | Chave primária |
| nome | VARCHAR(100) | Nome único do parâmetro (UNIQUE) |
| percentual | NUMERIC(5,2) | Valor percentual |
| created_at | TIMESTAMPTZ | Data de criação |
| updated_at | TIMESTAMPTZ | Data de atualização |

## Parâmetros padrão (seed)

| nome | percentual |
|------|-----------|
| MVA_PADRAO | 71.78 |
| ALIQUOTA_INTERNA | 18.00 |
| ICMS_NACIONAL | 12.00 |
| ICMS_IMPORTADO | 4.00 |

## Script SQL

``db/init/05-tables-parametro-tributario.sql``

