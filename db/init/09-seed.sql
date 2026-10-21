-- =====================================================================
-- 10-seed.sql
-- Dados iniciais do sistema.
-- Os UUIDs são gerados automaticamente pelo DEFAULT.
-- ATENÇÃO: o hash abaixo é de exemplo para desenvolvimento local.
-- Em produção, troque a senha no primeiro login ou gere dinamicamente
-- (ex.: via Flyway com placeholders).
-- =====================================================================

-- ---------------------------------------------------------------------
-- Papéis
-- ---------------------------------------------------------------------
INSERT INTO papel (nome) VALUES
    ('ADMIN'),
    ('USUARIO')
ON CONFLICT (nome) DO NOTHING;

-- ---------------------------------------------------------------------
-- Parâmetro tributário inicial (só se a tabela estiver vazia)
-- ---------------------------------------------------------------------
INSERT INTO parametro_tributario (mva_padrao, aliquota_interna, icms_nacional, icms_importado)
SELECT 40.00, 18.00, 12.00, 4.00
WHERE NOT EXISTS (SELECT 1 FROM parametro_tributario);

-- ---------------------------------------------------------------------
-- Usuário administrador inicial
-- ---------------------------------------------------------------------
INSERT INTO usuario (login, password_hash)
SELECT 'administrador', '$2a$12$eRq9DF.0Yxm3WjoaE6WiXOw4YPmVBVXeMS.UlMllGOBWBcSwHyU4i'
WHERE NOT EXISTS (SELECT 1 FROM usuario WHERE login = 'administrador');

-- ---------------------------------------------------------------------
-- Associação administrador <-> papel ADMIN
-- ---------------------------------------------------------------------
INSERT INTO usuario_papel (usuario_id, papel_id)
SELECT u.id, p.id
FROM usuario u
JOIN papel p ON p.nome = 'ADMIN'
WHERE u.login = 'administrador'
  AND NOT EXISTS (
      SELECT 1 FROM usuario_papel up
      WHERE up.usuario_id = u.id AND up.papel_id = p.id
  );