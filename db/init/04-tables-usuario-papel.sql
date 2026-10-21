CREATE TABLE IF NOT EXISTS usuario_papel (
    usuario_id  UUID NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    papel_id    UUID NOT NULL REFERENCES papeis(id)   ON DELETE CASCADE,
    PRIMARY KEY (usuario_id, papel_id)
);