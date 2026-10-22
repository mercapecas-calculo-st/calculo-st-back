-- =====================================================================
-- Catálogo de tributos/parâmetros utilizados nos cálculos.
-- Cada linha é um tributo com seu percentual.
-- Os valores iniciais são inseridos pelo seed (09-seed.sql).
-- =====================================================================

CREATE TABLE IF NOT EXISTS parametro_tributario (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome        VARCHAR(100) NOT NULL UNIQUE,
    percentual    NUMERIC(5,2) NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_parametro_percentual
        CHECK (percentual >= 0 AND percentual <= 100)
);

