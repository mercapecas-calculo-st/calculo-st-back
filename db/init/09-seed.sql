-- =====================================================================
-- 09-seed.sql
-- Dados iniciais do sistema.
-- Os UUIDs são gerados automaticamente pelo DEFAULT.
-- ATENÇÃO: o hash abaixo é de exemplo para desenvolvimento local.
-- Em produção, troque a senha no primeiro login ou gere dinamicamente
-- (ex.: via Flyway com placeholders).
-- =====================================================================

-- ---------------------------------------------------------------------
-- Papéis
-- ---------------------------------------------------------------------
INSERT INTO papeis (nome) VALUES
    ('ADMIN'),
    ('USUARIO')
ON CONFLICT (nome) DO NOTHING;

-- ---------------------------------------------------------------------
-- Parâmetro tributário inicial (só se a tabela estiver vazia)
-- ---------------------------------------------------------------------
INSERT INTO parametro_tributario (nome, percentual) VALUES
    ('MVA_PADRAO',       71.7800),
    ('ALIQUOTA_INTERNA', 18.0000),
    ('ICMS_NACIONAL',    12.0000),
    ('ICMS_IMPORTADO',    4.0000)
ON CONFLICT (nome) DO NOTHING;

-- ---------------------------------------------------------------------
-- Usuário administrador inicial
-- ---------------------------------------------------------------------
INSERT INTO usuarios (login, nome, password_hash)
SELECT 'administrador', 'Administrador', '$2a$12$eRq9DF.0Yxm3WjoaE6WiXOw4YPmVBVXeMS.UlMllGOBWBcSwHyU4i'
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE login = 'administrador');

-- ---------------------------------------------------------------------
-- Associação administrador <-> papel ADMIN
-- ---------------------------------------------------------------------
INSERT INTO usuario_papel (usuario_id, papel_id)
SELECT u.id, p.id
FROM usuarios u
JOIN papeis p ON p.nome = 'ADMIN'
WHERE u.login = 'administrador'
  AND NOT EXISTS (
      SELECT 1 FROM usuario_papel up
      WHERE up.usuario_id = u.id AND up.papel_id = p.id
  );


  