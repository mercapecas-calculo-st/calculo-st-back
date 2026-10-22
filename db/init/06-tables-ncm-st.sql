-- =====================================================================
-- 06-tables-ncm-st.sql
-- Cadastro de NCMs (RAIZ e DERIVADO) e regras de ST.
--
-- Regras de negócio aplicadas no banco:
--   - RAIZ     : código com 4 dígitos, sem pai (pai_id IS NULL).
--   - DERIVADO : código com 8 dígitos, com pai obrigatório (pai_id NOT NULL).
--   - mva_ncm  : NOT NULL (seed/reset garantem valor; admin pode alterar).
--   - cest_ncm : opcional; quando presente, 7 dígitos.
--
-- A validação "os 4 primeiros dígitos do DERIVADO = codigo_ncm do RAIZ pai"
-- NÃO é feita aqui (CHECK não compara linhas). Fica no backend Java (Fase 3).
-- =====================================================================

CREATE TABLE IF NOT EXISTS ncm_st (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tipo        VARCHAR(10)  NOT NULL,
    codigo_ncm  VARCHAR(8)   NOT NULL,
    mva_ncm     NUMERIC(5,2) NOT NULL,
    cest_ncm    VARCHAR(7),
    pai_id      UUID REFERENCES ncm_st(id),
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_ncm_tipo
        CHECK (tipo IN ('RAIZ', 'DERIVADO')),

    CONSTRAINT chk_ncm_codigo_por_tipo
        CHECK (
            (tipo = 'RAIZ'     AND codigo_ncm ~ '^[0-9]{4}$') OR
            (tipo = 'DERIVADO' AND codigo_ncm ~ '^[0-9]{8}$')
        ),

    CONSTRAINT chk_ncm_cest_formato
        CHECK (cest_ncm IS NULL OR cest_ncm ~ '^[0-9]{7}$'),

    CONSTRAINT chk_ncm_pai_obrigatorio_para_derivado
        CHECK (
            (tipo = 'RAIZ'     AND pai_id IS NULL) OR
            (tipo = 'DERIVADO' AND pai_id IS NOT NULL)
        )
);