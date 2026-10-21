---
title: Usuarios
sidebar_position: 2
---

# Feature: Usuarios

Armazena as credenciais dos usuarios do sistema.

## Tabela usuario

| Coluna | Tipo | Descricao |
|--------|------|-----------|
| id | UUID | Chave primaria |
| login | TEXT | Login do usuario |
| password_hash | TEXT | Hash da senha |
| created_at | TIMESTAMPTZ | Data de criacao |
| updated_at | TIMESTAMPTZ | Data de atualizacao |

## Script SQL

``db/init/02-tables-usuarios.sql``

