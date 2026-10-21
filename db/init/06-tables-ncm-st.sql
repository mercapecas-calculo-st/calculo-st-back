CREATE TABLE IF NOT EXISTS ncm_st (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tipo        VARCHAR(10) NOT NULL,
    codigo_ncm  VARCHAR(8)  NOT NULL,
    mva_ncm     NUMERIC(5,2),
    cest_ncm    VARCHAR(7),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_ncm_tipo
        CHECK (tipo IN ('RAIZ', 'DERIVADO')),
    CONSTRAINT chk_ncm_codigo_por_tipo
        CHECK (
            (tipo = 'RAIZ'     AND codigo_ncm ~ '^[0-9]{4}$') OR
            (tipo = 'DERIVADO' AND codigo_ncm ~ '^[0-9]{8}$')
        ),
    CONSTRAINT chk_ncm_cest_formato
        CHECK (cest_ncm IS NULL OR cest_ncm ~ '^[0-9]{7}$')
);