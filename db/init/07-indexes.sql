-- =====================================================================
-- 08-indexes.sql
-- Índices adicionais (PK e UNIQUE já criam os seus implicitamente).
-- =====================================================================

-- A PK composta já cobre buscas por usuario_id; idx_usuario_papel_pepel_id garante o índice por papel_id também.
CREATE INDEX IF NOT EXISTS idx_usuario_papel_papel_id
    ON usuario_papel(papel_id);

-- Busca por código NCM (chave natural de consulta frequente).
CREATE INDEX IF NOT EXISTS idx_ncm_st_codigo_ncm
    ON ncm_st(codigo_ncm);