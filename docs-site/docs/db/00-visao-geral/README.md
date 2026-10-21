---
title: Visao Geral
sidebar_position: 1
---

# Visao Geral do Projeto

O projeto **Calculo ST** utiliza **Docker** e **Docker Compose** para isolar
e executar o banco de dados **PostgreSQL (versao 17)**.

A criacao da estrutura (tabelas, funcoes, triggers) e a insercao de dados
iniciais (seed) sao feitas de forma automatizada na primeira inicializacao
do container, utilizando a pasta montada ``db/init``.

## Objetivo

Fornecer uma base de dados robusta e versionada para calculos de
**Substituicao Tributaria (ST)**, com regras de negocio aplicadas
diretamente no banco (constraints, triggers e validacoes).

