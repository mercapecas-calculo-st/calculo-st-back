---
title: Usuarios
sidebar_position: 2
---

# Feature: Usuarios

Armazena as credenciais dos usuários do sistema.

## Tabela usuarios

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | UUID | Chave primária |
| login | VARCHAR(255) | Login único (UNIQUE) |
| nome | VARCHAR(255) | Nome do usuário |
| password_hash | VARCHAR(255) | Hash da senha |
| created_at | TIMESTAMPTZ | Data de criação |
| updated_at | TIMESTAMPTZ | Data de atualização |

## Script SQL

`db/init/02-tables-usuarios.sql`