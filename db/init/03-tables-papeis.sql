CREATE TABLE IF NOT EXISTS papeis (
    id      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome    VARCHAR(50) NOT NULL UNIQUE
)