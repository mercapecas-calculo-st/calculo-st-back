-- =====================================================================
-- 08-triggers.sql
-- Triggers de manutenção (updated_at).
-- Depende de: 02-functions.sql (set_updated_at)
-- =====================================================================

CREATE TRIGGER trg_usuarios_updated_at
    BEFORE UPDATE ON usuarios
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_papeis_updated_at
    BEFORE UPDATE ON papeis
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_parametro_tributario_updated_at
    BEFORE UPDATE ON parametro_tributario
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_ncm_st_updated_at
    BEFORE UPDATE ON ncm_st
    FOR EACH ROW EXECUTE FUNCTION set_updated_at();

    