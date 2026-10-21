---
title: Estrutura de Pastas
---

# Estrutura de Pastas

```text
calculo-st/
  .env                  # Variaveis de ambiente (NAO versionado)
  .env.example          # Exemplo de variaveis
  .gitignore            # Arquivos ignorados
  docker-compose.yml    # Container do Postgres (base — usado no local e no VPS)
  docker-compose.override.yml               # (só local — o Docker Compose carrega automaticamente quando você roda docker compose up):
  docker-compose.prod.yml (só VPS — você roda com docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d):
  db/
    init/               # Scripts SQL de bootstrap
      01-functions.sql
      02-tables-usuarios.sql
      03-tables-papeis.sql
      04-tables-usuario-papel.sql
      05-tables-parametro-tributario.sql
      06-tables-ncm-st.sql
      07-indexes.sql
      08-triggers.sql
      09-seed.sql
```

