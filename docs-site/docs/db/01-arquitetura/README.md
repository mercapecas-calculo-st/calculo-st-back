---
title: Arquitetura
---

# Arquitetura e Decisoes Tecnicas

## Tecnologias e Decisoes

| Item | Decisao | Justificativa |
|------|---------|---------------|
| PostgreSQL 17 Alpine | Imagem leve e oficial | Menor footprint |
| UUIDs | UUID v4 via gen_random_uuid() | Nativo no PG 17 |
| Timestamps | created_at / updated_at | TIMESTAMPTZ com fuso |
| Triggers | set_updated_at | Atualiza updated_at automaticamente |
| Constraints | Validacoes via CHECK | Regras de negocio no banco |

