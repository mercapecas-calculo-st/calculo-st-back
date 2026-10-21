CREATE TABLE IF NOT EXISTS parametro_tributario (
    id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    mva_padrao        NUMERIC(5,2) NOT NULL,
    aliquota_interna  NUMERIC(5,2) NOT NULL,
    icms_nacional     NUMERIC(5,2) NOT NULL,
    icms_importado    NUMERIC(5,2) NOT NULL,
    created_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
